from org.gumtree.vis.mask import RectangleMask
from gumpy.vis.event import MouseListener, MaskEventListener, AWTMouseListener

# Script control setup area
# script info
__script__.title = 'Emu Plot Data'
__script__.version = '0.1'

SAVED_MASK_PRFN = 'kowari.savedMasks'

reg_changed = False
__mask_updated__ = False
class RegionEventListener(MaskEventListener):
    
    def __init__(self):
        MaskEventListener.__init__(self)
    
    def mask_added(self, mask):
        pass
            
    def mask_removed(self, mask):
        global reg_changed
        if not reg_changed:
            update_mask_list()
            run_intg()
    
    def mask_updated(self, mask):
        global reg_changed
        global __mask_updated__
        if not reg_changed:
            update_mask_list()
        __mask_updated__ = True
        
regionListener = RegionEventListener()

class MousePressListener(AWTMouseListener):
    def __init__(self):
        AWTMouseListener.__init__(self)
    
    def mouse_released(self, event):
        global __mask_updated__
        if __mask_updated__ :
            run_intg()
            __mask_updated__ = False
    
mouse_press_listener = MousePressListener()

def update_mask_list():
    if Plot1.ndim > 0:
        reg_list.value = mask2str(Plot1.get_masks())

# Use below example to create parameters.
# The type can be string, int, float, bool, file.
reg_enabled = Par('bool', True)
reg_enabled.title = 'region selection enabled'
reg_enabled.colspan = 2

reg_list = Par('string', '')
reg_list.title = 'masks[x_min, x_max, y_min, y_max]'
reg_list.enabled = True
reg_list.colspan = 2
def change_masks():
    global reg_changed
    reg_changed = True
    masks = Plot1.get_masks()
    if masks != None and len(masks) > 0:
        for mask in masks:
            Plot1.remove_mask(mask)
    if reg_list.value != None and reg_list.value.strip() != '':
        masks = str2maskstr(reg_list.value)
        for mask in masks:
            Plot1.add_mask_2d(float(mask[0]), float(mask[1]), \
                              float(mask[2]), float(mask[3]), mask[4])
    run_intg()
    reg_changed = False
    print 'masks are updated'
#if reg_list.value.strip() == '':
#    update_mask_list()
reg_discard = Act('discard_masks()', 'Discard Mask Change')
reg_accept = Act('accept_masks()', 'Accept Mask Change')
g_reg = Group('Region Selection')
g_reg.numColumns = 2
g_reg.add(reg_enabled, reg_list, reg_discard, reg_accept)
            

# Use below example to create a button
act_plot1 = Act('plot_data()', 'Plot Selected Data') 
def plot_data():
    dss = __DATASOURCE__.getSelectedDatasets()
#    for dinfo in dss:
    if len(dss) > 0:
        dinfo = dss[0]
        loc = dinfo.getLocation()
        ds = df[str(loc)]
        if ds.ndim == 3 :
            d0 = ds[0]
        elif ds.ndim == 4:
            d0 = ds[0, 0]
        Plot1.set_dataset(d0)
        Plot1.set_mask_listener(regionListener)
        Plot2.set_dataset(d0.sum(1))
    else:
        slog('please select at least one dataset')
# Use below example to create a new Plot
# Plot4 = Plot(title = 'new plot')

# This function is called when pushing the Run button in the control UI.
def __run_script__(fns):
    # Use the provided resources, please don't remove.
    global Plot1
    global Plot2
    global Plot3
    
    # check if a list of file names has been given
#    if (fns is None or len(fns) == 0) :
#        print 'no input datasets'
#    else :
#        for fn in fns:
#            # load dataset with each file name
#            ds = df[fn]
#            if ds.ndim == 3 :
#                Plot1.set_dataset(ds[0])
#            elif ds.ndim == 4:
#                Plot1.set_dataset(ds[0, 0])
    plot_data()
    
def __dispose__():
    global Plot1
    global Plot2
    global Plot3
    Plot1.clear()
    Plot2.clear()
    Plot3.clear()
    
def str2maskstr(value):
    items = value.split(';')
    res = []
    for item in items:
        name = item[0:item.index('[')];
        rstr = item[item.index('[') + 1 : item.index(']')]
        range = rstr.split(',')
        range.append(name)
        res.append(range)
    return res

def str2mask(value):
    items = value.split(';')
    masks = []
    for item in items:
        name = item[0:item.index('[')];
        rstr = item[item.index('[') + 1 : item.index(']')]
        range = rstr.split(',')
        mask = RectangleMask(True, float(range[0]), float(range[2]), \
                             float(range[1]) - float(range[0]), \
                             float(range[3]) - float(range[2]))
        mask.name = name
        masks.append(mask)
    return masks

def mask2str(masks):
    res = ''
    for mask in masks:
        res += mask.name
        res += '[' + ('%.1f' % round(mask.minX, 1)) + ',' + ('%.1f' % round(mask.maxX, 1)) + ',' \
                + ('%d' % round(mask.minY)) + ',' + ('%d' % round(mask.maxY)) + ']'
        if masks.indexOf(mask) < len(masks) - 1:
            res += ';'
    return res

