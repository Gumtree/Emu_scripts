from gumpy.nexus.fitting import Fitting, GAUSSIAN_FITTING
from gumpy.vis.event import MouseListener
import traceback
import time
# Script control setup area
# script info
__script__.title = 'Trace Peak in Time-of-Flight'
__script__.version = '1.0'
_FITTING_GAP = 0.0

class FrameMouseListener(MouseListener):
    
    def __init__(self):
        MouseListener.__init__(self)
        
    def on_click(self, event):
        global _RES1
        x = event.getX()
        try:
            idx = _RES1.axes[1].tolist().index(x)
            sel_xbin.value = idx
        except:
            traceback.print_exc(file=sys.stdout)
            print 'script control has been updated, please run the reduction again.'

    def on_double_click(self, event):
        global _RES1
        x = event.getX()
        try:
            idx = _RES1.axes[1].tolist().index(x)
            sel_xbin.value = idx
        except:
            traceback.print_exc(file=sys.stdout)
            print 'script control has been updated, please run the reduction again.'

class TubeMouseListener(MouseListener):
    
    def __init__(self):
        MouseListener.__init__(self)
        
    def on_click(self, event):
        global _RES1
        x = event.getX()
        try:
            idx = _RES1.axes[0].tolist().index(x)
            sel_frame.value = idx
        except:
            traceback.print_exc(file=sys.stdout)
            print 'script control has been updated, please run the reduction again.'

    def on_double_click(self, event):
        global _RES1
        x = event.getX()
        try:
            idx = _RES1.axes[0].tolist().index(x)
            sel_frame.value = idx
        except:
            traceback.print_exc(file=sys.stdout)
            print 'script control has been updated, please run the reduction again.'

#_DS = None
#_RES1 = None
#_FIT = dict()

# Use below example to create parameters.
# The type can be string, int, float, bool, file.
data_name = Par('string', 'default', options = ['default', 'total_t', \
                                         'total_xt', 'xtaux', 'ytaux'])
data_name.title = 'select data'
act_plot1 = Act('plot_data_each_step()', 'Find Peaks of Time-of-Flight')
act_hist = Act('show_2d_hist()', 'Plot 2D Histogram')
act_hist.independent = True
act_profile = Act('show_1d_profile()', 'Plot Peaks of Selected Tube')
act_profile.independent = True
#act_fit1_tubes = Act('fit_tubes()', 'Draw Peak Position For All Tubes')
g_data = Group('2D Frame for Each Scan Step')
g_data.numColumns = 2
g_data.add(data_name, act_plot1, act_hist, act_profile)

sel_frame = Par('int', 0, options = range(13), command = 'select_frame()')
sel_frame.title = 'frame index'
scan_pos = Par('label', ' ' * 10 + '--' + ' ' * 10)
nav_left = Act('jump_left()', '<-')
nav_left.independent = True
nav_right = Act('jump_right()', '->')
nav_right.independent = True
g_frame = Group('Select Scan Variable Value')
g_frame.numColumns = 2
g_frame.add(sel_frame, scan_pos, nav_left, nav_right)

sel_xbin = Par('int', 0, options = range(35), command = 'select_xbin()')
sel_xbin.title = 'tube index'
xbin_id = Par('label', ' ' * 10 + '--' + ' ' * 10)
bin_left = Act('left_bin()', '<-')
bin_left.independent = True
bin_right = Act('right_bin()', '->')
bin_right.independent = True
g_xbin = Group('Select Detector Tube')
g_xbin.numColumns = 2
g_xbin.add(sel_xbin, xbin_id, bin_left, bin_right)

fit_min1 = Par('float', 15000)
fit_min1.title = 'x min'
fit_max1 = Par('float', 35000)
fit_max1.title = 'x max'
peak1_pos = Par('float', 'NaN')
peak1_pos.title = 'peak 1 position'
FWHM1 = Par('float', 'NaN')
act_fit1 = Act('fit_curve1()', 'Fit Again')
act_accept1 = Act('accept_fit1()', 'Accept Fit Result')
g_fit1 = Group('Fit for Peak 1')
g_fit1.numColumns = 2
g_fit1.add(fit_min1, fit_max1, peak1_pos, FWHM1, act_fit1, act_accept1)

fit_min2 = Par('float', 95000)
fit_min2.title = 'x min'
fit_max2 = Par('float', 115000)
fit_max2.title = 'x max'
peak2_pos = Par('float', 'NaN')
peak2_pos.title = 'peak 2 position'
FWHM2 = Par('float', 'NaN')
act_fit2 = Act('fit_curve2()', 'Fit Again')
act_accept2 = Act('accept_fit2()', 'Accept Fit Result')
g_fit2 = Group('Fit for Peak 2')
g_fit2.numColumns = 2
g_fit2.add(fit_min2, fit_max2, peak2_pos, FWHM2, act_fit2, act_accept2)

Plot2.set_dataset(Dataset([float('nan')]))
Plot2.title = ''
Plot2.y_label = ''
Plot2.x_label = ''
Plot2.set_legend_on(False)
Plot2.set_mouse_listener(FrameMouseListener())
Plot3.set_dataset(Dataset([float('nan')]))
Plot3.title = ''
Plot3.y_label = ''
Plot3.x_label = ''
Plot3.set_legend_on(False)
Plot3.set_mouse_listener(TubeMouseListener())

def show_2d_hist():
    dss = __DATASOURCE__.getSelectedDatasets()
#    for dinfo in dss:
    if len(dss) > 0:
        dinfo = dss[0]
        loc = dinfo.getLocation()
        ds = df[str(loc)]
        if data_name.value == 'default':
            if ds.ndim != 3 :
                raise Exception, 'data must be 3-dimensional, get ' + str(ds.ndim)
            n_frame = len(ds)
            axis2 = ds.axes[2]
            if sel_frame.value >= n_frame:
                raise Exception, 'frame index out of bound, got ' + str(sel_frame.value)
#            scan_pos.value = str(axis0.name) + ': ' + '%.2f' % axis0[sel_frame.value]
            Plot1.set_dataset(ds[sel_frame.value])
            Plot1.title = str(ds.name) + ' index: ' + str(sel_frame.value) + ' ' + str(scan_pos.value)
            if sel_xbin.value < len(axis2):
                Plot1.add_x_marker(axis2[sel_xbin.value] + 0.5, 1000, 'white')
        else :
            d = ds[str(data_name.value)]
            if d.ndim == 3:
                pd = Dataset(d[0], axes=[range(d.shape[1]), range(d.shape[2])])
                Plot1.set_dataset(pd)
            elif d.ndim == 2:
                pd = Dataset(d[0], axes=[range(d.shape[1])])
                Plot1.set_dataset(pd)
    else:
        slog('please select at least one dataset')

def show_1d_profile():
    global _DS, _RES1, _RES2, _FIT
    try:
        if _RES1 == None or _FIT == None:
            slog('fit result does not exist, please run finding peak function first')
    except:
        slog('fit result does not exist, please run finding peak function first')
    
    idx = sel_frame.value
    if idx < 0 or idx >= len(_RES1):
        raise Exception, 'index ' + str(idx) + ' out of bound'
    Plot1.set_dataset(_DS[sel_frame.value, :, sel_xbin.value].get_reduced())
    Plot1.title = str(_DS.name) + ' ' + str(scan_pos.value) + ' ' + str(xbin_id.value)
    Plot1.y_label = 'counts'
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p1']
    Plot1.add_dataset(fr['res'])
    log('POS_OF_PEAK1 = '  + '%.1f' % fr['mean'])
    log('FWHM1 = ' + '%.1f' % (2.35482 * fr['sigma']))
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p2']
    Plot1.add_dataset(fr['res'])
    log('POS_OF_PEAK2 = '  + '%.1f' % fr['mean'])
    log('FWHM2 = ' + '%.1f' % (2.35482 * fr['sigma']))
        
# Use below example to create a button
def plot_data_each_step():
    global _DS, _RES1, _RES2, _FIT, _FITTING_GAP
    dss = __DATASOURCE__.getSelectedDatasets()
#    for dinfo in dss:
    if len(dss) == 0:
        slog('please select at least one dataset')
        return
        
    dinfo = dss[0]
    loc = dinfo.getLocation()
    ds = df[str(loc)]
    _FIT = dict()
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
        
        n_bin = _DS.shape[2]
        axis2 = _DS.axes[2]
        sel_xbin.options = range(n_bin)
        if sel_xbin.value >= n_bin:
            sel_xbin.value = 0
        xbin_id.value = str(axis2.name) + ': ' + '%.2f' % (axis2[sel_xbin.value] + 0.5)
            
#        Plot1.set_dataset(_DS[sel_frame.value])
#        Plot1.title = str(ds.name) + ' index: ' + str(sel_frame.value) + ' ' + str(scan_pos.value)

#        Plot1.set_mask_listener(regionListener)
#        Plot1.set_awt_mouse_listener(mouse_press_listener)
#        masks = []
#        if reg_enabled.value :
#            if len(Plot1.get_masks()) > 0:
#                masks = Plot1.get_masks()
#            else :
#                if reg_list.value != None and reg_list.value.strip() != '':
#                    masks = str2maskstr(reg_list.value)
#                    for mask in masks:
#                        Plot1.add_mask_2d(float(mask[0]), float(mask[1]), \
#                                          float(mask[2]), float(mask[3]), mask[4])
#                    masks = Plot1.get_masks()
#        _RES1 = v_intg(_DS, masks)
        _RES1 = zeros([_DS.shape[0], _DS.shape[2]])
        _RES2 = zeros([_DS.shape[0], _DS.shape[2]])
        axis = _DS.axes[1]
        axis_min = axis.min()
        axis_max = axis.max()
        _RES1.set_axes([_DS.axes[0], _DS.axes[2]])
        _RES2.set_axes([_DS.axes[0], _DS.axes[2]])
#        fitting = Fitting(GAUSSIAN_FITTING)
        for i in xrange(_DS.shape[0]):
            print 'processing for frame ' + str(i)
            for j in xrange(_DS.shape[2]):
#                cv = _DS[4, :, 4].get_reduced(1)
                cv = _DS[i, :, j].get_reduced(1)
                try:
                    fitting = Fitting(GAUSSIAN_FITTING)
#                    fitting.set_histogram(cv, axis_min, (axis_max + axis_min) / 2.)
                    fitting.set_histogram(cv, fit_min1.value, fit_max1.value)
#                    fitting.set_param('mean', (axis_max + 3 * axis_min) / 4.)
                    fitting.set_bounds('mean', fit_min1.value, fit_max1.value)
                    fitting.set_bounds('sigma', 1000, 10000)
                    fitting.set_param('mean', 26000)
                    fitting.set_param('sigma', 4000)
                    time.sleep(_FITTING_GAP)
                    res1 = fitting.fit()
                    res1.title = 'fitting1'
                    res1.var[:] = 0
#                    Plot3.set_dataset(res)
#                    print i, j, 1, fitting.params['mean'], fitting.params['sigma']
                    _RES1[i, j] = fitting.params['mean']
                    fr = dict()
                    fr['res'] = res1
                    fr['mean'] = fitting.params['mean']
                    fr['sigma'] = fitting.params['sigma']
                    fr['xmin'] = fit_min1.value
                    fr['xmax'] = fit_max1.value
                    _FIT['i' + str(i) + 'j' + str(j) + 'p1'] = fr
#                    Plot3.add_dataset(res)
                    if i == 0 and j == 0 :
                        Plot1.set_dataset(cv)
                        Plot1.add_dataset(res1)
                        Plot1.title = str(_DS.name) + ' ' + str(scan_pos.value) + ' ' + str(xbin_id.value)
                        Plot1.y_label = 'counts'
                        peak1_pos.value = fitting.params['mean']
                        FWHM1.value = 2.35482 * fitting.params['sigma']

                    fitting = Fitting(GAUSSIAN_FITTING)
                    fitting.set_histogram(cv, fit_min2.value, fit_max2.value)
#                    fitting.set_param('mean', (axis_max + 3 * axis_min) / 4.)
                    fitting.set_bounds('mean', fit_min2.value, fit_max2.value)
                    fitting.set_bounds('sigma', 1000, 10000)
                    fitting.set_param('mean', 105000)
                    fitting.set_param('sigma', 4000)
                    time.sleep(_FITTING_GAP)
                    res2 = fitting.fit()
                    res2.title = 'fitting2'
                    res2.var[:] = 0
#                    Plot3.set_dataset(res)
#                    print i, j, 2, fitting.params['mean'], fitting.params['sigma']
                    _RES2[i, j] = fitting.params['mean']
                    fr = dict()
                    fr['res'] = res2
                    fr['mean'] = fitting.params['mean']
                    fr['sigma'] = fitting.params['sigma']
                    fr['xmin'] = fit_min2.value
                    fr['xmax'] = fit_max2.value
                    _FIT['i' + str(i) + 'j' + str(j) + 'p2'] = fr
                    
                    if i == 0 and j == 0 :
                        Plot1.add_dataset(res2)
                        peak2_pos.value = fitting.params['mean']
                        FWHM2.value = 2.35482 * fitting.params['sigma']
                except:
                    traceback.print_exc(file=sys.stdout)
            if i == 0 :
                _RES1.title = 'Peaks of ' + str(_DS.name)
                _RES2.title = 'Peaks of ' + str(_DS.name)
                d1 = _RES1[0]
                d1.title = 'peak1'
                d2 = _RES2[0]
                d2.title = 'peak2'
                Plot2.set_dataset(d1)
                Plot2.add_dataset(d2)
                Plot2.set_legend_on(False)
                Plot2.y_label = _DS.axes[1].title
                Plot2.x_label = _DS.axes[2].title
                Plot2.title = str(_RES1.title) + ' Index: ' \
                            + str(sel_frame.value) + ' ' + str(scan_pos.value)
                Plot2.clear_markers()
                Plot2.add_marker(_RES1.axes[1][0], d1[0])
                Plot2.add_marker(_RES2.axes[1][0], d2[0])
                
                d1 = _RES1[:, 0].get_reduced(1)
                d1.title = 'peak1'
                d2 = _RES2[:, 0].get_reduced(1)
                d2.title = 'peak2'
                Plot3.set_dataset(d1)
                Plot3.add_dataset(d2)
                Plot3.set_legend_on(False)
                Plot3.y_label = _DS.axes[1].title
                Plot3.x_label = _DS.axes[0].title
                Plot3.title = str(_RES1.title) + ' Index: ' \
                            + str(sel_xbin.value) + ' ' + str(xbin_id.value)
                Plot3.clear_markers()
                Plot3.add_marker(_RES1.axes[0][0], d1[0])
                Plot3.add_marker(_RES2.axes[0][0], d2[0])
                
#                break
            else:
                d1 = _RES1[:, sel_xbin.value].get_reduced(1)
                d1.title = 'peak1'
                d2 = _RES2[:, 0].get_reduced(1)
                d2.title = 'peak2'
                Plot3.set_dataset(d1)
                Plot3.add_dataset(d2)
                Plot3.title = str(_RES1.title) + ' Index: ' \
                            + str(sel_xbin.value) + ' ' + str(xbin_id.value)
                Plot3.clear_markers()
                iframe = sel_frame.value
                Plot3.add_marker(d1.axes[0][iframe], d1[iframe])
                Plot3.add_marker(d2.axes[0][iframe], d2[iframe])
#            break
        
#        _RES1 = _DS.intg(1)
        
#        save_preference()
    else :
        d = ds[str(data_name.value)]
        _DS = Dataset(d, axes = [range(d.shape[0]), range(d.shape[1]), range(d.shape[2])])
        if d.ndim == 3:
            pd = Dataset(d[0], axes=[range(d.shape[1]), range(d.shape[2])])
            Plot1.set_dataset(pd)
        elif d.ndim == 2:
            pd = Dataset(d[0], axes=[range(d.shape[1])])
            Plot1.set_dataset(pd)
    
    
    
def jump_left():
    if _DS != None and sel_frame.value > 0:
        sel_frame.value -= 1

def jump_right():
    if _DS != None and sel_frame.value < len(_DS) - 1:
        sel_frame.value += 1

def select_frame():
    global _DS, _RES1, _RES2, _FIT
    if _RES1 == None:
        return
    idx = sel_frame.value
    if idx < 0 or idx >= len(_RES1):
        raise Exception, 'index ' + str(idx) + ' out of bound'
    axis0 = _DS.axes[0]
    scan_pos.value = str(axis0.name) + ': ' + '%.2f' % axis0[idx]
#    Plot1.set_dataset(_DS[idx])
#    Plot1.title = str(_DS.name) + ' index: ' + str(idx) + ' ' + str(scan_pos.value)
    Plot1.set_dataset(_DS[sel_frame.value, :, sel_xbin.value].get_reduced())
    Plot1.title = str(_DS.name) + ' ' + str(scan_pos.value) + ' ' + str(xbin_id.value)
    Plot1.y_label = 'counts'
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p1']
    Plot1.add_dataset(fr['res'])
    fit_min1.value = fr['xmin']
    fit_max1.value = fr['xmax']
    peak1_pos.value = fr['mean']
    FWHM1.value = 2.35482 * fr['sigma']
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p2']
    Plot1.add_dataset(fr['res'])
    fit_min2.value = fr['xmin']
    fit_max2.value = fr['xmax']
    peak2_pos.value = fr['mean']
    FWHM2.value = 2.35482 * fr['sigma']

#    Plot1.set_mask_listener(regionListener)
#    Plot1.set_awt_mouse_listener(mouse_press_listener)
    d1 = _RES1[idx]
    d1.title = 'peak1'
    d2 = _RES2[idx]
    d2.title = 'peak2'
    Plot2.set_dataset(d1)
    Plot2.add_dataset(d2)
    Plot2.y_label = _DS.axes[1].title
    Plot2.x_label = _DS.axes[2].title
    Plot2.title = str(_RES1.title) + ' index: ' \
                + str(idx) + ' ' + str(scan_pos.value)
    Plot2.clear_markers()
    xbin = sel_xbin.value
    Plot2.add_marker(d1.axes[0][xbin], d1[xbin])
    Plot2.add_marker(d2.axes[0][xbin], d2[xbin])

    if Plot3.ds != None and len(Plot3.ds) >= 2:
        Plot3.clear_markers()
        s0 = Plot3.ds[0]
        s1 = Plot3.ds[1]
        Plot3.add_marker(s0.axes[0][idx], s0[idx])
        Plot3.add_marker(s1.axes[0][idx], s1[idx])

def left_bin():
    global _RES1, _RES2
    if _RES1 != None and _RES2 != None and sel_xbin.value > 0:
        sel_xbin.value -= 1

def right_bin():
    if _RES1 != None and _RES2 != None and sel_xbin.value < _RES1.shape[1] - 1:
        sel_xbin.value += 1

def select_xbin():
    global _DS, _RES1, _RES2
    if _RES1 == None or _RES2 == None :
        return
    idx = sel_xbin.value
    if idx < 0 or idx >= _RES1.shape[1]:
        raise Exception, 'index ' + str(idx) + ' out of bound'
    axis0 = _RES1.axes[1]
    xbin_id.value = str(axis0.name) + ': ' + '%.2f' % (axis0[idx] + 0.5)
#    Plot1.set_dataset(_DS[:, idx].get_reduced())
#    Plot1.title = str(_DS.name) + ' index: ' + str(idx) + ' ' + str(xbin_id.value)
    Plot1.set_dataset(_DS[sel_frame.value, :, sel_xbin.value].get_reduced())
    Plot1.title = str(_DS.name) + ' ' + str(scan_pos.value) + ' ' + str(xbin_id.value)
    Plot1.y_label = 'counts'
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p1']
    Plot1.add_dataset(fr['res'])
    fit_min1.value = fr['xmin']
    fit_max1.value = fr['xmax']
    peak1_pos.value = fr['mean']
    FWHM1.value = 2.35482 * fr['sigma']
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p2']
    Plot1.add_dataset(fr['res'])
    fit_min2.value = fr['xmin']
    fit_max2.value = fr['xmax']
    peak2_pos.value = fr['mean']
    FWHM2.value = 2.35482 * fr['sigma']

    d1 = _RES1[:, idx].get_reduced(1)
    d1.title = 'peak1'
    d2 = _RES2[:, idx].get_reduced(1)
    d2.title = 'peak2'
    Plot3.set_dataset(d1)
    Plot3.add_dataset(d2)
    Plot3.y_label = _DS.axes[1].title
    Plot3.x_label = _DS.axes[0].title
    Plot3.title = str(_RES1.title) + ' index: ' \
                + str(idx) + ' ' + str(xbin_id.value)

    Plot3.clear_markers()
    iframe = sel_frame.value
    Plot3.add_marker(d1.axes[0][iframe], d1[iframe])
    Plot3.add_marker(d2.axes[0][iframe], d2[iframe])

    if Plot2.ds != None and len(Plot2.ds) >= 2:
        Plot2.clear_markers()
        s0 = Plot2.ds[0]
        s1 = Plot2.ds[1]
        Plot2.add_marker(s0.axes[0][idx], s0[idx])
        Plot2.add_marker(s1.axes[0][idx], s1[idx])
                
def fit_curve1():
    global Plot1
    ds = Plot1.ds
    if len(ds) == 0:
        log('Error: no curve to fit in Plot1.\n')
        return
    for d in ds:
        if d.title == 'fitting1':
            Plot1.remove_dataset(d)
    d0 = ds[0]
    fitting = Fitting(GAUSSIAN_FITTING)
    try:
        fitting.set_histogram(d0, fit_min1.value, fit_max1.value)
        val = peak1_pos.value
        if val == val:
            fitting.set_param('mean', val)
        val = FWHM1.value
        if val == val:
            fitting.set_param('sigma', math.fabs(val / 2.35482))
        res = fitting.fit()
        res.var[:] = 0
        res.title = 'fitting1'
        Plot1.add_dataset(res)
        Plot1.pv.getPlot().setCurveMarkerVisible(Plot1.__get_NXseries__(res), False)
        mean = fitting.params['mean']
        mean_err = fitting.errors['mean']
        FWHM1.value = 2.35482 * math.fabs(fitting.params['sigma'])
        FWHM1_err = 5.54518 * math.fabs(fitting.errors['sigma'])
        log('POS_OF_PEAK1 = '  + '%.1f' % mean + ' +/- ' + '%.1f' % mean_err)
        log('FWHM1 = ' + '%.1f' % FWHM1.value + ' +/- ' + '%.1f' % FWHM1_err)
        log('Chi2 = ' + str(fitting.fitter.getQuality()))
        peak1_pos.value = fitting.mean
#        print fitting.params
    except:
#        traceback.print_exc(file = sys.stdout)
        log('can not fit\n')

def fit_curve2():
    global Plot1
    ds = Plot1.ds
    if len(ds) == 0:
        log('Error: no curve to fit in Plot1.\n')
        return
    for d in ds:
        if d.title == 'fitting2':
            Plot1.remove_dataset(d)
    d0 = ds[0]
    fitting = Fitting(GAUSSIAN_FITTING)
    try:
        fitting.set_histogram(d0, fit_min2.value, fit_max2.value)
        val = peak2_pos.value
        if val == val:
            fitting.set_param('mean', val)
        val = FWHM2.value
        if val == val:
            fitting.set_param('sigma', math.fabs(val / 2.35482))
        res = fitting.fit()
        res.var[:] = 0
        res.title = 'fitting2'
        Plot1.add_dataset(res)
        Plot1.pv.getPlot().setCurveMarkerVisible(Plot1.__get_NXseries__(res), False)
        mean = fitting.params['mean']
        mean_err = fitting.errors['mean']
        FWHM2.value = 2.35482 * math.fabs(fitting.params['sigma'])
        FWHM2_err = 5.54518 * math.fabs(fitting.errors['sigma'])
        log('POS_OF_PEAK2 = '  + '%.1f' % mean + ' +/- ' + '%.1f' % mean_err)
        log('FWHM2 = ' + '%.1f' % FWHM2.value + ' +/- ' + '%.1f' % FWHM2_err)
        log('Chi2 = ' + str(fitting.fitter.getQuality()))
        peak2_pos.value = fitting.mean
#        print fitting.params
    except:
#        traceback.print_exc(file = sys.stdout)
        log('can not fit\n')
        
def accept_fit1():
    global Plot1, _RES1, _FIT
    res = Plot1.get_dataset('fitting1')
    if res is None:
        raise Exception, 'fit result does not exist, make sure Plot1 has fitting curve'
    mean = peak1_pos.value
    if math.isnan(mean):
        raise Exception, 'fit result does not exist, got null peak position'
    fwhm = FWHM1.value
    if math.isnan(mean):
        raise Exception, 'fit result does not exist, got null FWHM'
    i = sel_frame.value
    j = sel_xbin.value
    _RES1[i, j] = mean
    fr = dict()
    fr['res'] = res
    fr['mean'] = mean
    fr['sigma'] = fwhm / 2.35482
    fr['xmin1'] = fit_min1.value
    fr['xmax1'] = fit_max1.value
    _FIT['i' + str(i) + 'j' + str(j) + 'p1'] = fr

    
    d1 = _RES1[i]
    d1.title = 'peak1'
    d2 = _RES2[i]
    d2.title = 'peak2'
    Plot2.set_dataset(d1)
    Plot2.add_dataset(d2)
    Plot2.y_label = _DS.axes[1].title
    Plot2.x_label = _DS.axes[2].title
    Plot2.title = str(_RES1.title) + ' index: ' \
                + str(i) + ' ' + str(scan_pos.value)
                
    d1 = _RES1[:, j].get_reduced(1)
    d1.title = 'peak1'
    d2 = _RES2[:, j].get_reduced(1)
    d2.title = 'peak2'
    Plot3.set_dataset(d1)
    Plot3.add_dataset(d2)
    Plot3.y_label = _DS.axes[1].title
    Plot3.x_label = _DS.axes[0].title
    Plot3.title = str(_RES1.title) + ' index: ' \
                + str(j) + ' ' + str(xbin_id.value)

    if Plot3.ds != None and len(Plot3.ds) >= 2:
        Plot3.clear_markers()
        idx = sel_frame.value
        s0 = Plot3.ds[0]
        s1 = Plot3.ds[1]
        Plot3.add_marker(s0.axes[0][idx], s0[idx])
        Plot3.add_marker(s1.axes[0][idx], s1[idx])

    if Plot2.ds != None and len(Plot2.ds) >= 2:
        Plot2.clear_markers()
        idx = sel_xbin.value
        s0 = Plot2.ds[0]
        s1 = Plot2.ds[1]
        Plot2.add_marker(s0.axes[0][idx], s0[idx])
        Plot2.add_marker(s1.axes[0][idx], s1[idx])

def accept_fit2():
    global Plot1, _RES2, _FIT
    res = Plot1.get_dataset('fitting2')
    if res is None:
        raise Exception, 'fit result does not exist, make sure Plot1 has fitting curve'
    mean = peak2_pos.value
    if math.isnan(mean):
        raise Exception, 'fit result does not exist, got null peak position'
    fwhm = FWHM2.value
    if math.isnan(mean):
        raise Exception, 'fit result does not exist, got null FWHM'
    i = sel_frame.value
    j = sel_xbin.value
    _RES2[i, j] = mean
    fr = dict()
    fr['res'] = res
    fr['mean'] = mean
    fr['sigma'] = fwhm / 2.35482
    fr['xmin1'] = fit_min1.value
    fr['xmax1'] = fit_max1.value
    _FIT['i' + str(i) + 'j' + str(j) + 'p2'] = fr

    d1 = _RES1[i]
    d1.title = 'peak1'
    d2 = _RES2[i]
    d2.title = 'peak2'
    Plot2.set_dataset(d1)
    Plot2.add_dataset(d2)
    Plot2.y_label = _DS.axes[1].title
    Plot2.x_label = _DS.axes[2].title
    Plot2.title = str(_RES1.title) + ' index: ' \
                + str(i) + ' ' + str(scan_pos.value)
                
    d1 = _RES1[:, j].get_reduced(1)
    d1.title = 'peak1'
    d2 = _RES2[:, j].get_reduced(1)
    d2.title = 'peak2'
    Plot3.set_dataset(d1)
    Plot3.add_dataset(d2)
    Plot3.y_label = _DS.axes[1].title
    Plot3.x_label = _DS.axes[0].title
    Plot3.title = str(_RES1.title) + ' index: ' \
                + str(j) + ' ' + str(xbin_id.value)
    
    if Plot3.ds != None and len(Plot3.ds) >= 2:
        Plot3.clear_markers()
        idx = sel_frame.value
        s0 = Plot3.ds[0]
        s1 = Plot3.ds[1]
        Plot3.add_marker(s0.axes[0][idx], s0[idx])
        Plot3.add_marker(s1.axes[0][idx], s1[idx])

    if Plot2.ds != None and len(Plot2.ds) >= 2:
        Plot2.clear_markers()
        idx = sel_xbin.value
        s0 = Plot2.ds[0]
        s1 = Plot2.ds[1]
        Plot2.add_marker(s0.axes[0][idx], s0[idx])
        Plot2.add_marker(s1.axes[0][idx], s1[idx])
        
# Use below example to create a new Plot
# Plot4 = Plot(title = 'new plot')

# This function is called when pushing the Run button in the control UI.
def __run_script__(fns):
    # Use the provided resources, please don't remove.
    global Plot1
    global Plot2
    global Plot3
    
    # check if a list of file names has been given
    if (fns is None or len(fns) == 0) :
        print 'no input datasets'
    else :
        for fn in fns:
            # load dataset with each file name
            ds = df[fn]
            print ds.shape
    print arg1_name.value
    
def __dispose__():
    global Plot1
    global Plot2
    global Plot3
    Plot1.clear()
    Plot2.clear()
    Plot3.clear()
