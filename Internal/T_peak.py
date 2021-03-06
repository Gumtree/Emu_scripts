from gumpy.nexus.fitting import Fitting, GAUSSIAN_FITTING
from gumpy.vis.event import MouseListener
import traceback
import time
import math
import json
# Script control setup area
# script info
__script__.title = 'Trace Peaks in Time-of-Flight'
__script__.version = '1.0'

__FP__ = {"mean" : 0, "sigma" : 1, "amplitude" : 2, \
                         "background" : 3}
__FN__ = {"mean" : 'peak in time', "sigma" : 'peak width', \
          "amplitude" : 'peak intensity', "background" : 'background level'}

class FrameMouseListener(MouseListener):
    
    def __init__(self):
        MouseListener.__init__(self)
        
    def on_click(self, event):
        global _RES1
        x = event.getX()
        try:
            idx = _RES1.axes[2].tolist().index(x)
            sel_xbin.value = idx
        except:
#            traceback.print_exc(file=sys.stdout)
#            print 'script control has been updated, please run the reduction again.'
            pass

    def on_double_click(self, event):
        global _RES1
        x = event.getX()
        try:
            idx = _RES1.axes[2].tolist().index(x)
            sel_xbin.value = idx
        except:
#            traceback.print_exc(file=sys.stdout)
#            print 'script control has been updated, please run the reduction again.'
            pass

class TubeMouseListener(MouseListener):
    
    def __init__(self):
        MouseListener.__init__(self)
        
    def on_click(self, event):
        global _RES1
        x = event.getX()
        try:
            idx = _RES1.axes[1].tolist().index(x)
            sel_frame.value = idx
        except:
#            traceback.print_exc(file=sys.stdout)
#            print 'script control has been updated, please run the reduction again.'
            pass

    def on_double_click(self, event):
        global _RES1
        x = event.getX()
        try:
            idx = _RES1.axes[1].tolist().index(x)
            sel_frame.value = idx
        except:
#            traceback.print_exc(file=sys.stdout)
#            print 'script control has been updated, please run the reduction again.'
            pass

#_DS = None
#_RES1 = None
#_FIT = dict()

# Use below example to create parameters.
# The type can be string, int, float, bool, file.
data_name = Par('string', 'default', options = ['default', 'total_t', \
                                         'total_xt', 'xtaux', 'ytaux'])
data_name.title = 'select data'
prop_name = Par('string', 'mean', options = __FP__.keys(), \
                command = 'change_prop()')
prop_name.title = 'select property'
act_plot1 = Act('plot_data_each_step()', 'Find Peaks of Time-of-Flight')
act_plot1.colspan = 2
act_hist = Act('show_2d_hist()', 'Plot 2D Histogram')
act_profile = Act('show_1d_profile()', 'Plot Peaks of Selected Tube')
#act_fit1_tubes = Act('fit_tubes()', 'Draw Peak Position For All Tubes')
g_data = Group('2D Frame for Each Scan Step')
g_data.numColumns = 2
g_data.add(data_name, prop_name, act_plot1, act_hist, act_profile)

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
fit_amp1 = Par('float', 'NaN')
fit_amp1.title = 'amplitude1'
fit_bkg1 = Par('float', 'NaN')
fit_bkg1.title = 'background1'
act_fit1 = Act('fit_curve1()', 'Fit Again')
act_accept1 = Act('accept_fit1()', 'Accept Fit Result')
g_fit1 = Group('Fit for Peak 1')
g_fit1.numColumns = 2
g_fit1.add(fit_min1, fit_max1, peak1_pos, FWHM1, fit_amp1, fit_bkg1, act_fit1, act_accept1)

fit_min2 = Par('float', 95000)
fit_min2.title = 'x min'
fit_max2 = Par('float', 115000)
fit_max2.title = 'x max'
peak2_pos = Par('float', 'NaN')
peak2_pos.title = 'peak 2 position'
FWHM2 = Par('float', 'NaN')
fit_amp2 = Par('float', 'NaN')
fit_amp2.title = 'amplitude2'
fit_bkg2 = Par('float', 'NaN')
fit_bkg2.title = 'background2'
act_fit2 = Act('fit_curve2()', 'Fit Again')
act_accept2 = Act('accept_fit2()', 'Accept Fit Result')
g_fit2 = Group('Fit for Peak 2')
g_fit2.numColumns = 2
g_fit2.add(fit_min2, fit_max2, peak2_pos, FWHM2, fit_amp2, fit_bkg2, act_fit2, act_accept2)

act_imp = Act('import_ascii()', 'Import Saved Result')
act_exp = Act('export_ascii()', 'Export to ASCII')
g_exp = Group('Import and Export')
g_exp.add(act_imp, act_exp)

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
    if idx < 0 or idx >= _RES1.shape[1]:
        raise Exception, 'index ' + str(idx) + ' out of bound'
    Plot1.set_dataset(_DS[sel_frame.value, :, sel_xbin.value].get_reduced())
    Plot1.title = str(_DS.name) + ' ' + str(scan_pos.value) + ' ' + str(xbin_id.value)
    Plot1.y_label = 'counts'
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p1']
    Plot1.add_dataset(fr['res'])
    log('POS_OF_PEAK1 = '  + '%.1f' % fr['mean'])
    log('FWHM1 = ' + '%.1f' % (2.35482 * fr['sigma']))
    log('AMPLITUDE1 = %.1f' % fr['amplitude'])
    log('BACKGROUND1 = %d' % fr['background'])
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p2']
    Plot1.add_dataset(fr['res'])
    log('POS_OF_PEAK2 = '  + '%.1f' % fr['mean'])
    log('FWHM2 = ' + '%.1f' % (2.35482 * fr['sigma']))
    log('AMPLITUDE2 = %.1f' % fr['amplitude'])
    log('BACKGROUND2 = %d' % fr['background'])
        
# Use below example to create a button
def plot_data_each_step():
    global _DS, _RES1, _RES2, _FIT
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
        _RES1 = zeros([len(__FP__), _DS.shape[0], _DS.shape[2]])
        _RES2 = zeros([len(__FP__), _DS.shape[0], _DS.shape[2]])
        axis0 = SimpleData(range(len(__FP__)))
        axis = _DS.axes[1]
        axis_min = axis.min()
        axis_max = axis.max()
        _RES1.set_axes([axis0, _DS.axes[0], _DS.axes[2]])
        _RES2.set_axes([axis0, _DS.axes[0], _DS.axes[2]])
#        fitting = Fitting(GAUSSIAN_FITTING)
        for i in xrange(_DS.shape[0]):
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
                    time.sleep(0.3)
                    res1 = fitting.fit()
                    res1.title = 'fitting1'
                    res1.var[:] = 0
#                    Plot3.set_dataset(res)
                    print i, j, 1, fitting.params['mean'], fitting.params['sigma']
                    fr = dict()
                    for key in __FP__.keys():
                        _RES1[__FP__[key], i, j] = fitting.params[key]
                        fr[key] = fitting.params[key]
                    fr['res'] = res1
#                    fr['mean'] = fitting.params['mean']
#                    fr['sigma'] = fitting.params['sigma']
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
                        fit_amp1.value = fitting.params['amplitude']
                        fit_bkg1.value = fitting.params['background']

                    fitting = Fitting(GAUSSIAN_FITTING)
                    fitting.set_histogram(cv, fit_min2.value, fit_max2.value)
#                    fitting.set_param('mean', (axis_max + 3 * axis_min) / 4.)
                    fitting.set_bounds('mean', fit_min2.value, fit_max2.value)
                    fitting.set_bounds('sigma', 1000, 10000)
                    fitting.set_param('mean', 105000)
                    fitting.set_param('sigma', 4000)
                    time.sleep(0.3)
                    res2 = fitting.fit()
                    res2.title = 'fitting2'
                    res2.var[:] = 0
#                    Plot3.set_dataset(res)
                    print i, j, 2, fitting.params['mean'], fitting.params['sigma']
                    fr = dict()
                    for key in __FP__.keys():
                        _RES2[__FP__[key], i, j] = fitting.params[key]
                        fr[key] = fitting.params[key]
                    fr['res'] = res2
#                    fr['mean'] = fitting.params['mean']
#                    fr['sigma'] = fitting.params['sigma']
                    fr['xmin'] = fit_min2.value
                    fr['xmax'] = fit_max2.value
                    _FIT['i' + str(i) + 'j' + str(j) + 'p2'] = fr
                    
                    if i == 0 and j == 0 :
                        Plot1.add_dataset(res2)
                        peak2_pos.value = fitting.params['mean']
                        FWHM2.value = 2.35482 * fitting.params['sigma']
                        fit_amp2.value = fitting.params['amplitude']
                        fit_bkg2.value = fitting.params['background']
                except:
                    traceback.print_exc(file=sys.stdout)
            if i == 0 :
                _RES1.title = 'Peak finding of ' + str(_DS.name)
                _RES2.title = 'Peak finding of ' + str(_DS.name)
                d1 = _RES1[__FP__[prop_name.value], 0]
                d1.title = 'peak1'
                d2 = _RES2[__FP__[prop_name.value], 0]
                d2.title = 'peak2'
                Plot2.set_dataset(d1)
                Plot2.add_dataset(d2)
                Plot2.set_legend_on(False)
                Plot2.y_label = __FN__[prop_name.value]
                Plot2.x_label = _DS.axes[2].title
                Plot2.title = str(_RES1.title) + ' Index: ' \
                            + str(sel_frame.value) + ' ' + str(scan_pos.value)
                Plot2.clear_markers()
                Plot2.add_marker(_RES1.axes[2][0], d1[0])
                Plot2.add_marker(_RES2.axes[2][0], d2[0])
                
                d1 = _RES1[__FP__[prop_name.value], :, 0].get_reduced(1)
                d1.title = 'peak1'
                d2 = _RES2[__FP__[prop_name.value], :, 0].get_reduced(1)
                d2.title = 'peak2'
                Plot3.set_dataset(d1)
                Plot3.add_dataset(d2)
                Plot3.set_legend_on(False)
                Plot3.y_label = __FN__[prop_name.value]
                Plot3.x_label = _DS.axes[0].title
                Plot3.title = str(_RES1.title) + ' Index: ' \
                            + str(sel_xbin.value) + ' ' + str(xbin_id.value)
                Plot3.clear_markers()
                Plot3.add_marker(_RES1.axes[1][0], d1[0])
                Plot3.add_marker(_RES2.axes[1][0], d2[0])
                
#                break
            else:
                d1 = _RES1[__FP__[prop_name.value], :, sel_xbin.value].get_reduced(1)
                d1.title = 'peak1'
                d2 = _RES2[__FP__[prop_name.value], :, 0].get_reduced(1)
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
    if idx < 0 or idx >= _RES1.shape[1] :
        raise Exception, 'index ' + str(idx) + ' out of bound'
    axis0 = _DS.axes[0]
    scan_pos.value = str(axis0.name) + ': ' + '%.2f' % axis0[idx]
#    Plot1.set_dataset(_DS[idx])
#    Plot1.title = str(_DS.name) + ' index: ' + str(idx) + ' ' + str(scan_pos.value)
    Plot1.set_dataset(_DS[sel_frame.value, :, sel_xbin.value].get_reduced())
    Plot1.title = str(_DS.name) + ' ' + str(scan_pos.value) + ' ' + str(xbin_id.value)
    Plot1.y_label = 'counts'
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p1']
    res = fr['res']
    if res != None:
        Plot1.add_dataset(fr['res'])
    fit_min1.value = fr['xmin']
    fit_max1.value = fr['xmax']
    peak1_pos.value = fr['mean']
    FWHM1.value = 2.35482 * fr['sigma']
    fit_amp1.value = fr['amplitude']
    fit_bkg1.value = fr['background']
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p2']
    res = fr['res']
    if res != None:
        Plot1.add_dataset(fr['res'])
    fit_min2.value = fr['xmin']
    fit_max2.value = fr['xmax']
    peak2_pos.value = fr['mean']
    FWHM2.value = 2.35482 * fr['sigma']
    fit_amp2.value = fr['amplitude']
    fit_bkg2.value = fr['background']

#    Plot1.set_mask_listener(regionListener)
#    Plot1.set_awt_mouse_listener(mouse_press_listener)
    d1 = _RES1[__FP__[prop_name.value], idx]
    d1.title = 'peak1'
    d2 = _RES2[__FP__[prop_name.value], idx]
    d2.title = 'peak2'
    Plot2.set_dataset(d1)
    Plot2.add_dataset(d2)
    Plot2.y_label = __FN__[prop_name.value]
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
    if _RES1 != None and _RES2 != None and sel_xbin.value < _RES1.shape[2] - 1:
        sel_xbin.value += 1

def select_xbin():
    global _DS, _RES1, _RES2
    if _RES1 == None or _RES2 == None :
        return
    idx = sel_xbin.value
    if idx < 0 or idx >= _RES1.shape[2]:
        raise Exception, 'index ' + str(idx) + ' out of bound'
    axis0 = _RES1.axes[2]
    xbin_id.value = str(axis0.name) + ': ' + '%.2f' % (axis0[idx] + 0.5)
#    Plot1.set_dataset(_DS[:, idx].get_reduced())
#    Plot1.title = str(_DS.name) + ' index: ' + str(idx) + ' ' + str(xbin_id.value)
    Plot1.set_dataset(_DS[sel_frame.value, :, sel_xbin.value].get_reduced())
    Plot1.title = str(_DS.name) + ' ' + str(scan_pos.value) + ' ' + str(xbin_id.value)
    Plot1.y_label = 'counts'
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p1']
    res = fr['res']
    if res != None:
        Plot1.add_dataset(fr['res'])
    fit_min1.value = fr['xmin']
    fit_max1.value = fr['xmax']
    peak1_pos.value = fr['mean']
    FWHM1.value = 2.35482 * fr['sigma']
    fit_amp1.value = fr['amplitude']
    fit_bkg1.value = fr['background']
    fr = _FIT['i' + str(sel_frame.value) + 'j' + str(sel_xbin.value) + 'p2']
    res = fr['res']
    if res != None:
        Plot1.add_dataset(fr['res'])
    fit_min2.value = fr['xmin']
    fit_max2.value = fr['xmax']
    peak2_pos.value = fr['mean']
    FWHM2.value = 2.35482 * fr['sigma']
    fit_amp2.value = fr['amplitude']
    fit_bkg2.value = fr['background']

    d1 = _RES1[__FP__[prop_name.value], :, idx].get_reduced(1)
    d1.title = 'peak1'
    d2 = _RES2[__FP__[prop_name.value], :, idx].get_reduced(1)
    d2.title = 'peak2'
    Plot3.set_dataset(d1)
    Plot3.add_dataset(d2)
    Plot3.y_label = __FN__[prop_name.value]
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
        val = fit_amp1.value
        if val == val:
            fitting.set_param('amplitude', val)
        val = fit_bkg1.value
        if val == val:
            fitting.set_param('background', val)
        res = fitting.fit()
        res.var[:] = 0
        res.title = 'fitting1'
        Plot1.add_dataset(res)
        Plot1.pv.getPlot().setCurveMarkerVisible(Plot1.__get_NXseries__(res), False)
        mean = fitting.params['mean']
        mean_err = fitting.errors['mean']
        FWHM1.value = 2.35482 * math.fabs(fitting.params['sigma'])
        FWHM1_err = 5.54518 * math.fabs(fitting.errors['sigma'])
        fit_amp1.value = fitting.params['amplitude']
        fit_bkg1.value = fitting.params['background']
        log('POS_OF_PEAK1 = '  + '%.1f' % mean + ' +/- ' + '%.1f' % mean_err)
        log('FWHM1 = ' + '%.1f' % FWHM1.value + ' +/- ' + '%.1f' % FWHM1_err)
        log('AMPLITUDE1 = %.1f' % fit_amp1.value)
        log('BACKGROUND1 = %d' % fit_bkg1.value)
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
        val = fit_amp2.value
        if val == val:
            fitting.set_param('amplitude', val)
        val = fit_bkg2.value
        if val == val:
            fitting.set_param('background', val)
        res = fitting.fit()
        res.var[:] = 0
        res.title = 'fitting2'
        Plot1.add_dataset(res)
        Plot1.pv.getPlot().setCurveMarkerVisible(Plot1.__get_NXseries__(res), False)
        mean = fitting.params['mean']
        mean_err = fitting.errors['mean']
        FWHM2.value = 2.35482 * math.fabs(fitting.params['sigma'])
        FWHM2_err = 5.54518 * math.fabs(fitting.errors['sigma'])
        fit_amp2.value = fitting.params['amplitude']
        fit_bkg2.value = fitting.params['background']
        log('POS_OF_PEAK2 = '  + '%.1f' % mean + ' +/- ' + '%.1f' % mean_err)
        log('FWHM2 = ' + '%.1f' % FWHM2.value + ' +/- ' + '%.1f' % FWHM2_err)
        log('AMPLITUDE2 = %.1f' % fit_amp2.value)
        log('BACKGROUND2 = %d' % fit_bkg2.value)
        log('Chi2 = ' + str(fitting.fitter.getQuality()))
        peak2_pos.value = fitting.mean
#        print fitting.params
    except:
        traceback.print_exc(file = sys.stdout)
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
    amp = fit_amp1.value
    if math.isnan(amp):
        raise Exception, 'fit result does not exist, got null amplitude'
    bkg = fit_bkg1.value
    if math.isnan(bkg):
        raise Exception, 'fit result does not exist, got null background'
    i = sel_frame.value
    j = sel_xbin.value
    fr = dict()
    fr['res'] = res
    fr['mean'] = mean
    fr['sigma'] = fwhm / 2.35482
    fr['amplitude'] = amp
    fr['background'] = bkg
    fr['xmin'] = fit_min1.value
    fr['xmax'] = fit_max1.value
    _RES1[__FP__[prop_name.value], i, j] = fr[prop_name.value]
    _FIT['i' + str(i) + 'j' + str(j) + 'p1'] = fr

    
    d1 = _RES1[__FP__[prop_name.value], i]
    d1.title = 'peak1'
    d2 = _RES2[__FP__[prop_name.value], i]
    d2.title = 'peak2'
    Plot2.set_dataset(d1)
    Plot2.add_dataset(d2)
    Plot2.y_label = __FN__[prop_name.value]
    Plot2.x_label = _DS.axes[2].title
    Plot2.title = str(_RES1.title) + ' index: ' \
                + str(i) + ' ' + str(scan_pos.value)
                
    d1 = _RES1[__FP__[prop_name.value], :, j].get_reduced(1)
    d1.title = 'peak1'
    d2 = _RES2[__FP__[prop_name.value], :, j].get_reduced(1)
    d2.title = 'peak2'
    Plot3.set_dataset(d1)
    Plot3.add_dataset(d2)
    Plot3.y_label = __FN__[prop_name.value]
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
    amp = fit_amp2.value
    if math.isnan(amp):
        raise Exception, 'fit result does not exist, got null amplitude'
    bkg = fit_bkg2.value
    if math.isnan(bkg):
        raise Exception, 'fit result does not exist, got null background'
    i = sel_frame.value
    j = sel_xbin.value
    fr = dict()
    fr['res'] = res
    fr['mean'] = mean
    fr['sigma'] = fwhm / 2.35482
    fr['amplitude'] = amp
    fr['background'] = bkg    
    fr['xmin'] = fit_min2.value
    fr['xmax'] = fit_max2.value
    _RES2[__FP__[prop_name.value], i, j] = fr[prop_name.value]
    _FIT['i' + str(i) + 'j' + str(j) + 'p2'] = fr

    d1 = _RES1[__FP__[prop_name.value], i]
    d1.title = 'peak1'
    d2 = _RES2[__FP__[prop_name.value], i]
    d2.title = 'peak2'
    Plot2.set_dataset(d1)
    Plot2.add_dataset(d2)
    Plot2.y_label = __FN__[prop_name.value]
    Plot2.x_label = _DS.axes[2].title
    Plot2.title = str(_RES1.title) + ' index: ' \
                + str(i) + ' ' + str(scan_pos.value)
                
    d1 = _RES1[__FP__[prop_name.value], :, j].get_reduced(1)
    d1.title = 'peak1'
    d2 = _RES2[__FP__[prop_name.value], :, j].get_reduced(1)
    d2.title = 'peak2'
    Plot3.set_dataset(d1)
    Plot3.add_dataset(d2)
    Plot3.y_label = __FN__[prop_name.value]
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

def change_prop():
    global _DS, _RES1, _RES2, _FIT, __FP__
    if _RES1 == None or _RES2 == None :
        return
    i = sel_frame.value
    j = sel_xbin.value
    prop = prop_name.value
    d1 = _RES1[__FP__[prop], i]
    d1.title = 'peak1'
    d2 = _RES2[__FP__[prop], i]
    d2.title = 'peak2'
    Plot2.set_dataset(d1)
    Plot2.add_dataset(d2)
    Plot2.y_label = __FN__[prop]
    Plot2.x_label = _DS.axes[2].title
    Plot2.title = str(_RES1.title) + ' index: ' \
                + str(i) + ' ' + str(scan_pos.value)
                
    d1 = _RES1[__FP__[prop], :, j].get_reduced(1)
    d1.title = 'peak1'
    d2 = _RES2[__FP__[prop], :, j].get_reduced(1)
    d2.title = 'peak2'
    Plot3.set_dataset(d1)
    Plot3.add_dataset(d2)
    Plot3.y_label = __FN__[prop]
    Plot3.x_label = _DS.axes[0].title
    Plot3.title = str(_RES1.title) + ' index: ' \
                + str(j) + ' ' + str(xbin_id.value)
    
    if Plot3.ds != None and len(Plot3.ds) >= 2:
        Plot3.clear_markers()
        s0 = Plot3.ds[0]
        s1 = Plot3.ds[1]
        Plot3.add_marker(s0.axes[0][i], s0[i])
        Plot3.add_marker(s1.axes[0][i], s1[i])

    if Plot2.ds != None and len(Plot2.ds) >= 2:
        Plot2.clear_markers()
        s0 = Plot2.ds[0]
        s1 = Plot2.ds[1]
        Plot2.add_marker(s0.axes[0][j], s0[j])
        Plot2.add_marker(s1.axes[0][j], s1[j])
    
            
def export_ascii():
    if _FIT is None:
        slog('No peak is available. Please find peaks first.')
        return
    name = _DS.name
    if name.__contains__('.'):
        name = name[0:name.index('.')]
    name += '.peaks.txt'
    fn = selectSaveFile(['*.txt'], fn=name)
    if fn is None:
        return
    if not fn.lower().endswith('.txt'):
        fn += '.txt'
    with open(fn, 'w') as f :
        f.write('#($var) is the variable name. Contents after that is the variable value.\n')
        f.write('$ds_name\n\'' + _DS.title + '\'\n')
        slog('exporting original dataset')
        write_dataset(f, _DS, 'dataset')
        slog('exporting peak 1 properties')
        write_dataset(f, _RES1, 'peak1')
#        f.write('#peak 1 properties: dim0=[mean, sigma, amplitude, background], dim1=' \
#                + _RES1.axes[1].title + ', dim2=' + _RES1.axes[2].title + '\n')
#        f.write('$_RES1\n' + _RES1.__repr__(skip=False) + '\n')
        slog('exporting peak 2 properties')
        write_dataset(f, _RES2, 'peak2')
#        f.write('#peak 2 properties: dim0=[mean, sigma, amplitude, background], dim1=' \
#                + _RES2.axes[1].title + ', dim2=' + _RES2.axes[2].title + '\n')
#        f.write('$_RES2\n' + _RES2.__repr__(skip=False) + '\n')
        slog('exporting fitting results')
        f.write('#fitting results for Gumtree purpose only. Object is a dictionary map.\n')
        f.write('#FIT_RESULT\n')
        f.write('$_DS\n')
        f.write(json.dumps(_DS, cls=DatasetEncoder, sort_keys=True))
        f.write('\n')
        f.write('$_RES1\n')
        f.write(json.dumps(_RES1, cls=DatasetEncoder, sort_keys=True))
        f.write('\n')
        f.write('$_RES2\n')
        f.write(json.dumps(_RES2, cls=DatasetEncoder, sort_keys=True))
        f.write('\n')
        f.write('$_FIT\n')
        f.write(json.dumps(_FIT, cls=DatasetEncoder, sort_keys=True))
#        f.write(json.dumps(_FIT, cls=DatasetEncoder, sort_keys=True))

def write_dataset(f, ds, name, show_error = False):
    f.write('#' + name + ' with shape: ' + str(ds.shape) + '\n')
    f.write('$' + name + '\n')
    f.write(str(ds.tolist()) + '\n')
    if show_error :
        f.write('$' + name + '_error' + '\n')
        f.write(str(ds.var.tolist()) + '\n')
    for i in xrange(ds.ndim):
        axis = ds.axes[i]
        f.write('#axis ' + str(i) + ': name=' + axis.name + ', units=' + axis.units + '\n')
        f.write('$' + name + '_axis_' + str(i) + '\n')
        f.write(str(axis.tolist()) + '\n')

def import_ascii():
    global _DS, _RES1, _RES2, _FIT
    fn = selectLoadFile(ext = ['*.txt'])
    if fn is None:
        return
    t1 = time.time()
    with open(fn, 'r') as f:
        found = False
        for line in f:
            if line.startswith('#FIT_RESULT'):
                found = True
                break
        if not found:
            raise Exception, 'failed to find FIT_RESULT'
        slog('please wait, this will take a couple of minutes')
        vn = None
        vv = None
        for line in f:
            if line.startswith('#') :
                continue
            if line.startswith('$') :
                if vn != None and vv != None :
                    slog('decoding ' + vn)
                    item = json.loads(vv, cls = DatasetDecoder)
                    globals()[vn] = item
                vn = line[1:].strip()
                vv = ''
            else:
                vv += line
        if vn != None and vv != None :
            slog('decoding ' + vn)
            item = json.loads(vv, cls = DatasetDecoder)
            globals()[vn] = item
    if len(sel_xbin.options) != _DS.shape[2]:
        sel_xbin.options = range(_DS.shape[2])
    if len(sel_frame.options) != _DS.shape[0]:
        sel_frame.options = range(_DS.shape[0])
    if sel_xbin.value == 0:
        select_xbin()
    else:
        sel_xbin.value = 0
    if sel_frame.value == 0:
        select_frame()
    else:
        sel_frame.value = 0
    
#    slog('time cost = ' + str(time.time() - t1))
        
class DatasetEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Dataset):
            if (obj.title.startswith('fitting')):
                return None
            d = dict()
            d['name'] = obj.name
            d['ndim'] = obj.ndim
            d['shape'] = obj.shape
            d['data'] = obj.tolist()
#            d['var'] = obj.var.tolist()
            for i in xrange(obj.ndim):
                axis = obj.axes[i]
                ad = dict()
                ad['name'] = axis.name
                ad['data'] = axis.tolist()
                ad['units'] = axis.units
                d['axis_' + str(i)] = ad
#            return json.JSONEncoder.default(self, d)
            return d
#            return obj.__repr__(skip=False)
#            return None
        # Let the base class default method raise the TypeError
        return json.JSONEncoder.default(self, obj)
    
class DatasetDecoder(json.JSONDecoder):

    def __init__(self, *args, **kargs):
        json.JSONDecoder.__init__(self, object_hook=self.dict_to_dataset,
                             *args, **kargs)
    
    def dict_to_dataset(self, d): 
        if 'ndim' not in d:
            return d

        ndim = d.pop('ndim')
        name = d.pop('name')
        shape = d.pop('shape')
        data = d.pop('data')
#        if 'var' in d:
#            var = d.pop('var')
#        else :
#            var = None
        axes = []
        for i in xrange(ndim):
            a = d.pop('axis_' + str(i))
            aname = a.pop('name')
            adata = a.pop('data')
            aunits = a.pop('units')
            axis = SimpleData(adata, title = aname, units = aunits)
            axes.append(axis)
        ds = Dataset(data, shape = shape, name = name, axes = axes)
        return ds

    
def export_hdf():
    fn = selectSaveFile(ext=['hdf'])
    if fn is None:
        return
    if not fn.lower().endswith('.hdf'):
        fn += '.hdf'
    raise Exception, 'not implemented'
    
# Use below example to create a new Plot
# Plot4 = Plot(title = 'new plot')

# This function is called when pushing the Run button in the control UI.
def __run_script__(fns):
    # Use the provided resources, please don't remove.
    global Plot1
    global Plot2
    global Plot3
    show_2d_hist()
    
def __dispose__():
    global Plot1
    global Plot2
    global Plot3
    Plot1.clear()
    Plot2.clear()
    Plot3.clear()
