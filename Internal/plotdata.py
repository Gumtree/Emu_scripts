from gumpy.nexus.fitting import Fitting, GAUSSIAN_FITTING
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

_DS = None
_RES = None

# Use below example to create a new Plot
Plot4 = GPlot(view_title = 'Plot4: Data')
Plot3.set_view_title('Plot3: Fitting')

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

data_name = Par('string', 'default', options = ['default', 'total_t', \
                                         'total_xt', 'xtaux', 'ytaux'])
data_name.title = 'select data'
act_plot1 = Act('plot_data()', 'Plot Selected Data')
sel_frame = Par('int', 0, options = [0], command = 'select_frame()')
sel_frame.title = 'frame index'
scan_pos = Par('label', ' ' * 10 + '--' + ' ' * 10)
nav_left = Act('jump_left()', '<-')
nav_right = Act('jump_right()', '->')
g_data = Group('Select Data')
g_data.numColumns = 2
g_data.add(data_name, act_plot1, sel_frame, scan_pos, nav_left, nav_right)

# Use below example to create parameters.
# The type can be string, int, float, bool, file.
reg_enabled = Par('bool', True)
reg_enabled.title = 'region selection enabled'
reg_enabled.colspan = 2

reg_list = Par('string', '', options=['I1[21.0,50.0,31809,96997]'])
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
            
g_intg = Group('Draw Sensitivity Profile')
scan_var = Par('str', 'mom', options=['mom'])
scan_var.title = 'scan variable'
act_intg = Act('plot_intensity()', 'Plot Tube Sensitivity')
g_intg.add(scan_var, act_intg)

g_fit2 = Group('Gaussian 2D Fitting')
g_fit2.numColumns = 2
x_peak = Par('float', 'NaN')
x_peak.title = 'x peak position'
y_peak = Par('float', 'NaN')
y_peak.title = 'y peak position'
x_width = Par('float', 'NaN')
x_width.title = 'x FWHM'
y_width = Par('float', 'NaN')
y_width.title = 'y FWHM'
amp_par = Par('float', 'NaN')
amp_par.title = 'peak intensity'
bkg_par = Par('float', 'NaN')
bkg_par.title = 'background/peak'
fit_act = Act('fit_2d()', 'Fit Plot3')
fit_chi2 = Par('float', 'NaN')
g_fit2.add(x_peak, x_width, y_peak, y_width, amp_par, bkg_par, fit_act, fit_chi2)

def plot_data():
    global _DS, _RES
    dss = __DATASOURCE__.getSelectedDatasets()
#    for dinfo in dss:
    if len(dss) > 0:
        dinfo = dss[0]
        loc = dinfo.getLocation()
        ds = df[str(loc)]
        if data_name.value == 'default':
            if ds.ndim == 3 :
                _DS = ds
            else :
                raise Exception, 'data must be 3-dimensional, get ' + str(ds.ndim)
            n_frame = len(_DS)
            axis0 = _DS.axes[0]
            sel_frame.options = range(n_frame)
            if sel_frame.value >= n_frame:
                sel_frame.value = 0
            scan_pos.value = str(axis0.name) + ': ' + '%.2f' % axis0[sel_frame.value]
            Plot1.set_dataset(_DS[sel_frame.value])
            Plot1.set_mask_listener(regionListener)
            Plot1.set_awt_mouse_listener(mouse_press_listener)
            Plot1.title = str(ds.name) + ' index: ' + str(sel_frame.value) + ' ' + str(scan_pos.value)
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
            _RES = v_intg(_DS, masks)
            Plot2.set_dataset(_RES[0])
            Plot2.set_legend_on(False)
            Plot2.y_label = 'counts'
            Plot2.title = 'Integration of ' + str(ds.name) + ' Index: ' \
                        + str(sel_frame.value) + ' ' + str(scan_pos.value)
            save_preference()
        else :
            d = ds[str(data_name.value)]
            _DS = Dataset(d, axes = [range(d.shape[0]), range(d.shape[1]), range(d.shape[2])])
            if d.ndim == 3:
                pd = Dataset(d[0], axes=[range(d.shape[1]), range(d.shape[2])])
                Plot1.set_dataset(pd)
            elif d.ndim == 2:
                pd = Dataset(d[0], axes=[range(d.shape[1])])
                Plot1.set_dataset(pd)
    else:
        slog('please select at least one dataset')

def select_frame():
    global _DS, _RES
    if _DS == None:
        return
    idx = sel_frame.value
    if idx < 0 or idx >= len(_DS):
        raise Exception, 'index ' + str(idx) + ' out of bound'
    axis0 = _DS.axes[0]
    scan_pos.value = str(axis0.name) + ': ' + '%.2f' % axis0[idx]
    Plot1.set_dataset(_DS[idx])
    Plot1.title = str(_DS.name) + ' index: ' + str(idx) + ' ' + str(scan_pos.value)
    Plot1.set_mask_listener(regionListener)
    Plot1.set_awt_mouse_listener(mouse_press_listener)
#    masks = []
#    if reg_enabled.value :
#        if len(Plot1.get_masks()) > 0:
#            masks = Plot1.get_masks()
#        else :
#            if reg_list.value != None and reg_list.value.strip() != '':
#                masks = str2maskstr(reg_list.value)
#                for mask in masks:
#                    Plot1.add_mask_2d(float(mask[0]), float(mask[1]), \
#                                      float(mask[2]), float(mask[3]), mask[4])
#                masks = Plot1.get_masks()
#    di = v_intg(_DS, masks)
    Plot2.set_dataset(_RES[idx])
    Plot2.y_label = 'counts'
    Plot2.title = 'Integration of ' + str(_DS.name) + ' index: ' \
                + str(idx) + ' ' + str(scan_pos.value)
#    save_preference()

def jump_left():
    if _DS != None and sel_frame.value > 0:
        sel_frame.value -= 1

def jump_right():
    if _DS != None and sel_frame.value < len(_DS) - 1:
        sel_frame.value += 1
            
def plot_intensity():
    global Plot3, Plot4
    Plot4.clear()
    dss = __DATASOURCE__.getSelectedDatasets()
#    for dinfo in dss:
    if len(dss) <= 1:
        slog('please select at least two data files')
        return
    masks = []
    if reg_enabled.value :
        if reg_list.value != None and reg_list.value.strip() != '':
            masks = str2mask(reg_list.value)
    haxis = None
    nbin = 0
#    if len(masks) > 0:
#        it = zeros([len(masks), len(dss)])
#        for i in xrange(len(dss)):
#            dinfo = dss[i]
#            loc = dinfo.getLocation()
#            ds = df[str(loc)]
#            if ds.ndim == 3 :
#                d0 = ds
#            elif ds.ndim == 4:
#                d0 = ds[0]
#            for j in xrange(len(masks)):
#                mask = masks[j]
#                it[j, i] = v_intg(d0, [mask]).sum()
#        for i in xrange(len(masks)) :
#            cv = it[i]
#            cv.title = masks[i].name
#            Plot4.add_dataset(cv)
#    else:
    hs = get_ndim(dss[0])
    inv_seq = test_y_seq(dss[0], dss[-1])
    it = zeros([len(dss), hs])
    vaxis = arange(len(dss), float)
    for i in xrange(len(dss)):
        if inv_seq:
            dinfo = dss[len(dss) - 1 - i]
        else:
            dinfo = dss[i]
        loc = dinfo.getLocation()
        ds = df[str(loc)]
        if ds.ndim != 3 :
            raise Exception, 'must be 3-dimentional data'
        masks = []
        if reg_enabled.value :
            if len(Plot1.get_masks()) > 0:
                masks = Plot1.get_masks()
            else :
                if reg_list.value != None and reg_list.value.strip() != '':
                    mask_strs = str2maskstr(reg_list.value)
                    if Plot1.ds != None :
                        for mask in mask_strs:
                            Plot1.add_mask_2d(float(mask[0]), float(mask[1]), \
                                              float(mask[2]), float(mask[3]), mask[4])
                        masks = Plot1.get_masks()
        res = v_intg(ds, masks)
        it[i] = res.sum(0)
        vaxis[i] = ds[str(scan_var.value)][0]
        if i == 0:
            haxis = ds.axes[0]
#                nbin = d0.shape[-1]
    it.set_axes([vaxis, haxis], anames = [scan_var.value, haxis.title])
    Plot4.set_dataset(it)
    
    Plot4.y_label = scan_var.value + ' (degree)'
    Plot4.x_label = haxis.title + ' (' + haxis.units + ')'
    Plot4.title = 'Intensity Profile for Bin ' + str(sel_frame.value)
    fit_2d()
    slog( 'finished plotting')
    
def get_ndim(dinfo):
    ds = df[str(dinfo.getLocation())]
    return ds.shape[0]

def test_y_seq(dfirst, dlast):
    ds_f = df[str(dfirst.getLocation())]
    ds_l = df[str(dlast.getLocation())]
    return ds_f[str(scan_var.value)] > ds_l[str(scan_var.value)]
    
def update_plots():
    slog('mask changed')
    plot_data()
    dss = __DATASOURCE__.getSelectedDatasets()
    if Plot4.ds != None and len(dss) > 1:
        plot_intensity()

def save_preference():
    set_prof_value(SAVED_MASK_PRFN , str(reg_list.value))
    save_pref()
        
def fit_2d():
    global Plot3, Plot4
    ds = Plot4.ds
    if ds is None or len(ds) == 0:
        log('Error: no curve to fit in Plot4.\n')
        return
    if ds.ndim != 2:
        log('Error: Plot4 must have 2D data.\n')
        return
    y_name = ds.axes[0].name
    x_name = ds.axes[1].name
#    for d in ds:
#        if d.title == 'fitting':
#            Plot1.remove_dataset(d)
#    d0 = ds[0]
    
    fitting = Fitting(GAUSSIAN_FITTING, 2)
    try:
        fitting.set_histogram(ds)
        val = x_peak.value
        if val == val:
            fitting.set_param('m2', val)
        else:
            fitting.set_param('m2', 21.25)
        val = x_width.value
        if val == val:
            fitting.set_param('s2', math.fabs(val / 2.35482))
        val = y_peak.value
        if val == val:
            fitting.set_param('m1', val)
        else:
            fitting.set_param('m1', 21.75)
        val = y_width.value
        if val == val:
            fitting.set_param('s1', math.fabs(val / 2.35482))
        res = fitting.fit()
#        res.var[:] = 0
        res.title = 'fitting'
#        Plot1.add_dataset(res)
#        Plot1.pv.getPlot().setCurveMarkerVisible(Plot1.__get_NXseries__(res), False)
        m1 = fitting.params['m1']
        m1_err = fitting.errors['m1']
        y_peak.value = m1
        m2 = fitting.params['m2']
        m2_err = fitting.errors['m2']
        x_peak.value = m2
        y_width.value = 2.35482 * math.fabs(fitting.params['s1'])
        y_width_err = 5.54518 * math.fabs(fitting.errors['s1'])
        x_width.value = 2.35482 * math.fabs(fitting.params['s2'])
        x_width_err = 5.54518 * math.fabs(fitting.errors['s2'])
        a = fitting.params['a']
        b = fitting.params['b']
        amp_par.value = math.fabs(a + b)
        bkg_par.value = math.fabs(b / (a + b))
        fit_chi2.value = fitting.fitter.getQuality()
        log('************* Fitting Result ******************')
        log(y_name + ' PEAK_POSITION = ' + str(m1) + ' +/- ' + str(m1_err))
        log(y_name + ' FWHM = ' + str(y_width.value) + ' +/- ' + str(y_width_err))
        log(x_name + ' PEAK_POSITION = ' + str(m2) + ' +/- ' + str(m2_err))
        log(x_name + ' FWHM = ' + str(x_width.value) + ' +/- ' + str(x_width_err))
        log('PEAK_INTENSITY = ' + str(amp_par.value))
        log('BACKGROUND/PEAK = ' + str(bkg_par.value))
        log('FITTING_QUALLITY_CHI2 = ' + str(fit_chi2.value))
        log('***********************************************')
        Plot3.set_dataset(res)
        Plot3.x_label = x_name
        Plot3.y_label = y_name
#        print fitting.params
    except:
        traceback.print_exc(file = sys.stdout)
        log('can not fit\n')

#g_exp = Group('Export to CSV')
#exp_act = Act('export_csv()', 'Export')
#g_exp.add(exp_act)
#        
#def export_csv():
#    fn = selectSaveFile(ext = ['*.csv'])
#    if fn is None:
#        return
    

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
    global Plot4
    global _DS
    Plot1.clear()
    Plot2.clear()
    Plot3.clear()
    Plot4.close()
    _DS = None
    df.datasets.clear()
    
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
            res[:, x_iMin : x_iMax] = ds[:, y_iMin : y_iMax, x_iMin : x_iMax].intg(1)
#            res[:, x_iMin : x_iMax] = ds[:, :, x_iMin : x_iMax].intg(1)
        res.axes[0] = ds.axes[0]
        res.axes[1] = ds.axes[2]
        mask = masks[0]
        res.copy_metadata_shallow(ds)
        res.append_log('Processed with: apply mask y in [' + ('%d' % round(mask.minY)) + ',' \
                       + ('%d' % round(mask.maxY)) + '], x in [' + ('%.1f' % round(mask.minX, 1)) + ',' + ('%.1f' % round(mask.maxX, 1)) + ']')
        return res
    else:
        return ds.intg(1)
