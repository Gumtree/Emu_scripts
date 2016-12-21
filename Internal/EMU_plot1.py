# Script control setup area

# script info

__script__.title = 'EMU plot'
__script__.version = '1.0'

outputdirectory = 'C:/Users/emu/Documents/P5408_De Campo/out/'

# Use below example to create parameters.
# The type can be string, int, float, bool, file.

frame_FromFile = Par('string', 'NaN')
frame_FromFile.title = 'Available Frames'
frame_FromFile.enabled = False

timebins_FromFile = Par('string', 'NaN')
timebins_FromFile.title = 'Available Time Bins'
timebins_FromFile.enabled = False

detnumber_FromFile = Par('string', 'NaN')
detnumber_FromFile.title = 'Available Detectors'
detnumber_FromFile.enabled = False

g1 = Group('Read EMU file')
g1.numColumns = 3 #9
g1.add(frame_FromFile,
       timebins_FromFile,
       detnumber_FromFile)



print_temperatures = Par('bool', False)
print_temperatures.colspan = 3
print_temperatures.title = 'print temperatures'

g2 = Group('Display temperatures for CF12 with hot stick')
g2.add(print_temperatures)

Plot2D = Par('bool', False)
Plot2D.title = '2D Plot'
Plot2D.colspan = 1
Plot2D_content = Par('string', 'Det vs. Time (Frame averaged)', options = ['Det vs. Time (Frame averaged)', 'Detector vs. Frame (Time averaged)', 'Time vs. Frame (Detector averaged)'])
Plot2D_content.title = 'Choose'

frame2D_start = Par('int',0)
frame2D_start.title = 'Frame Number: '
frame2D_end = Par('int',0)
frame2D_end.title = 'to'

timebin2D_start = Par('int', 0)
timebin2D_start.title = 'Time bin from '
timebin2D_end = Par('int', 0)
timebin2D_end.title = 'to '

detnumber2D_start = Par('int', 0)
detnumber2D_start.title = 'Detector tube number from '
detnumber2D_end = Par('int', 0)
detnumber2D_end.title = 'to '

g3 = Group('Plot 2D')
g3.numColumns = 2 #9
g3.add(Plot2D,
       Plot2D_content,
       frame2D_start, frame2D_end,
       timebin2D_start, timebin2D_end,
       detnumber2D_start, detnumber2D_end)

Plot1D = Par('bool', True)
Plot1D.title = '1D Plot'
Plot1D.colspan = 1

Plot1D_content = Par('string', 'Temperature Scan', options = ['Temperature Scan', 'Option1', 'Option2'])
Plot1D_content.title = 'Choose'

frame1D_start = Par('int',0)
frame1D_start.title = 'Frame Number: '
frame1D_end = Par('int',0)
frame1D_end.title = 'to'

timebin1D_start = Par('int', 0)
timebin1D_start.title = 'Time bin from '
timebin1D_end = Par('int', 0)
timebin1D_end.title = 'to '

detnumber1D_start = Par('int', 0)
detnumber1D_start.title = 'Detector tube number from '
detnumber1D_end = Par('int', 0)
detnumber1D_end.title = 'to '

Export1D = Par('bool', True)
Export1D.title = 'Export 1D data'
Export1D.colspan = 1

label1D = Par('label', 'Please fill in :)')

g4 = Group('Plot 1D')
g4.numColumns = 2 #9
g4.add(Plot1D,
       Plot1D_content,
       frame1D_start, frame1D_end,
       timebin1D_start, timebin1D_end,
       detnumber1D_start, detnumber1D_end,
       Export1D, label1D)

# This function is called when pushing the Run button in the control UI.

def __run_script__(fns):

    # Use the provided resources, please don't remove.

    global Plot1
    global Plot2
    global Plot3
    print ''

    if (fns is None or len(fns) == 0) :
        print 'no input datasets'
    else :
        for fn in fns:
            # load dataset with each file name
            df.datasets.clear()
            ds = df[fn]
            filename = os.path.basename(fn) # gets rid of the path
            filename = filename[:filename.find('.nx.hdf')] # gets rid of the hdf
            filename = filename.replace('0000','')           

            frame_FromFile.value  = ds.shape[0]
            timebins_FromFile.value  = ds.shape[1]
            detnumber_FromFile.value  = ds.shape[2]
            
            # Gumtree reads hmm_total_xt

            ds.__iDictionary__.addEntry('t01_setpoint', 'entry1/data/T01SP00')
            ds.__iDictionary__.addEntry('t02_setpoint', 'entry1/data/T02SP00')
            ds.__iDictionary__.addEntry('t01_sensor', 'entry1/data/T01S00')
            ds.__iDictionary__.addEntry('t02_sensor', 'entry1/data/T02S00')
            ds.__iDictionary__.addEntry('samplename', 'entry1/sample/name')
            
            print ''
            print 'Filename:', filename, ' Sample Name: ', str(ds.samplename)
            print ''

            if print_temperatures.value:               
                print 't1_setpoint, t1_sensor, t2_setpoint, t2_sensor'
                for i in range(ds.shape[0]):
                    print ds.t01_setpoint[i], ' ', ds.t01_sensor[i],' ', ds.t02_setpoint[i],' ', ds.t02_sensor[i]

            if Plot2D.value:
                Plot2D_data = copy(ds)
                Plot2D_data.axes[0] = range(Plot2D_data.shape[0]) # to make them integers
                Plot2D_data.axes[1] = range(Plot2D_data.shape[1]) # to make them integers
                Plot2D_data.axes[2] = range(Plot2D_data.shape[2]) # to make them integers

                if str(Plot2D_content.value) == 'Det vs. Time (Frame averaged)':
                    print '2D option 1'
                    Plot2D_data = Plot2D_data[frame2D_start.value:frame2D_end.value+1,
                                              :,
                                              :]

                    Plot2D_data = Plot2D_data.intg(0)
                    Plot2D_data.axes[0].title = 'time'
                    Plot2D_data.axes[1].title = 'detector'
                                        
                if str(Plot2D_content.value) == 'Detector vs. Frame (Time averaged)':
                    print '2D option 2'
                    Plot2D_data = Plot2D_data[:,
                                              timebin2D_start.value:timebin2D_end.value+1,
                                              :]
                    
                    Plot2D_data = Plot2D_data.intg(1)
                    Plot2D_data.axes[0].title = 'frame'
                    Plot2D_data.axes[1].title = 'detector'
                    
                if str(Plot2D_content.value) == 'Time vs. Frame (Detector averaged)':
                    print '2D option 3'
                    Plot2D_data = Plot2D_data[:,
                                              :,
                                              detnumber2D_start.value:detnumber2D_end.value]
                    
                    Plot2D_data = Plot2D_data.intg(2)
                    Plot2D_data.axes[0].title = 'frame'
                    Plot2D_data.axes[1].title = 'time'
                
                Plot1.clear()
                Plot1.set_dataset(Plot2D_data)
                
            if Plot1D.value:
                Plot1D_data = copy(ds)
            
                if str(Plot1D_content.value) == 'Temperature Scan':
                    print '1D Temperature Scan'
                    Plot1D_data = Plot1D_data[frame1D_start.value:frame1D_end.value+1,
                                              timebin1D_start.value:timebin1D_end.value+1,
                                              detnumber1D_start.value:detnumber1D_end.value]
                    
                    Plot1D_data = Plot1D_data.sum(0)
                    Plot1D_data.axes[0] = ds.t02_sensor[frame1D_start.value:frame1D_end.value+1]
                    Plot2.set_dataset(Plot1D_data)
                    Plot2.title = 'Temperature Scan'
                    Plot2.x_label = 'temperature [K]'
                    Plot2.y_label = 'counts'
                    
                    if Export1D.value: 
                        print 'exporting'
                        
                        export_ascii_1D(Plot1D_data, outputdirectory + 'TempScan_' + filename +
                                                            '_Detector_'+ str(detnumber1D_start.value) + 'to' + str(detnumber1D_end.value) +
                                                            '_Timebin_'+ str(timebin1D_start.value) + 'to' + str(timebin1D_end.value) + '.txt')
                   

def export_ascii_1D(ds, path):

    f = open(path, 'w')    
    x = str(ds.axes[0].title)
    y = str(ds.title)       
    f.write("%s    %s" % (x, y) + '\n')
    for i in xrange(len(ds)):
       f.write("%5g %15g" % (ds.axes[0][i], ds.storage[i]) + '\n')            
    f.close() 

# from here onwards not used...

def proc_fn(path):
    ds = df[str(path)]    
    print 'hello function path: i am not sure what I am doing here'

def __dispose__():
    global Plot1
    global Plot2
    global Plot3
    Plot1.clear()
    Plot2.clear()
    Plot3.clear()