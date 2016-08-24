from org.gumtree.vis.mask import RectangleMask
from gumpy.vis.event import MouseListener, MaskEventListener, AWTMouseListener
import math

# Script control setup area
# script info
__script__.title = 'Emu Plot Data'
__script__.version = '0.1'

SAVED_MASK_PRFN = 'emu.savedMasks'

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
            update_plots()
    
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
            update_plots()
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
s_mask = get_prof_value(SAVED_MASK_PRFN)
if not s_mask is None and s_mask.strip() != '':
    reg_list.value = s_mask
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
    update_plots()
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
            d0 = ds
        elif ds.ndim == 4:
            d0 = ds[0]
        Plot1.set_dataset(d0[0])
        Plot1.set_mask_listener(regionListener)
        Plot1.set_awt_mouse_listener(mouse_press_listener)
        Plot1.title = str(ds.name)
        masks = []
        if reg_enabled.value :
            if len(Plot1.get_masks()) > 0:
                masks = Plot1.get_masks()
            else :
                if reg_list.value != None and reg_list.value.strip() != '':
                    masks = str2maskstr(reg_list.value)
                    for mask in masks:
                        Plot1.add_mask_2d(float(mask[0]), float(mask[1]), \
                                          float(mask[2]), float(mask[3]), mask[4])
                    masks = Plot1.get_masks()
        di = v_intg(d0, masks)
        Plot2.set_dataset(di[0])
        Plot2.title = str(ds.name)
        save_preference()
    else:
        slog('please select at least one dataset')
        
def update_plots():
    slog('mask changed')
    plot_data()

def save_preference():
    set_prof_value(SAVED_MASK_PRFN , str(reg_list.value))
    save_pref()
        
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

def accept_masks():
    change_masks()

def discard_masks():
    update_mask_list()

def v_intg(ds, masks):
    if len(masks) > 0 :
        x_axis = ds.axes[-1]
        y_axis = ds.axes[-2]
        res = dataset.instance([ds.shape[0], ds.shape[2]], float('NaN'), dtype=float)
        for mask in masks:
            y_iMin = int((mask.minY - y_axis[0]) / (y_axis[-1] - y_axis[0]) \
                         * (y_axis.size - 1))
            if y_iMin < 0 :
                y_iMin = 0
            if y_iMin >= y_axis.size:
                continue
            y_iMax = int((mask.maxY - y_axis[0]) / (y_axis[-1] - y_axis[0]) \
                         * (y_axis.size - 1)) + 1
            if y_iMax < 0:
                continue
            x_iMin = int((mask.minX - x_axis[0]) / (x_axis[-1] - x_axis[0]) \
                         * (x_axis.size - 1))
            if x_iMin < 0:
                x_iMin = 0;
            if x_iMin >= x_axis.size:
                continue
            x_iMax = int((mask.maxX - x_axis[0]) / (x_axis[-1] - x_axis[0]) \
                         * (x_axis.size - 1)) + 1
            if x_iMax < 0:
                continue
#            res[:, x_iMin : x_iMax] = ds[:, y_iMin : y_iMax, x_iMin : x_iMax].intg(1)
            res[:, x_iMin : x_iMax] = ds[:, :, x_iMin : x_iMax].intg(1)
        res.axes[0] = ds.axes[0]
        res.axes[1] = ds.axes[2]
        mask = masks[0]
        res.copy_metadata_shallow(ds)
        res.append_log('Processed with: apply mask y in [' + ('%d' % round(mask.minY)) + ',' \
                       + ('%d' % round(mask.maxY)) + '], x in [' + ('%.1f' % round(mask.minX, 1)) + ',' + ('%.1f' % round(mask.maxX, 1)) + ']')
        return res
    else:
        return ds.intg(1)
