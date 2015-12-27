
# Code Book

Note: all values in final.txt are the means of normalized values (between -1 and 1) for specific subjects and activities.

## Description of variables

### Linear Acceleration and Angular Velocity

The following variables were objtained by filtering the raw accelrrometer and gyroscope signals, separating accelaration into body and gravity accelaration signals, then estimating the mean and standard deviations:

#### Body.Acceleration.Mean.[X,Y,Z,Magnitude]

Mean of the body linear acceleration (X, Y, Z components and magnitude)

#### Body.Acceleration.StdDev.[X,Y,Z,Magnitude]

Standard deviation of the body linear acceleration (X, Y, Z components and magnitude)

#### Gravity.Acceleration.Mean.[X,Y,Z,Magnitude]

Mean of the gravity linear acceleration (X, Y, Z components and magnitude)

#### Gravity.Acceleration.StdDev.[X,Y,Z,Magnitude]

Standard deviation of the gravity linear acceleration (X, Y, Z components and magnitude)

#### Body.Gyroscope.Mean.[X,Y,Z,Magnitude]

Mean of the angular velocity (X, Y, Z components and magnitude)

#### Body.Gyroscope.StdDev.[X,Y,Z,Magnitude]

Standard deviation of the angular velocity (X, Y, Z components and magnitude)

### Jerk Signals

The following "jerk" signals were obtained by deriving body linear acceleration and angular velocity in time.

#### Body.Acceleration.Jerk.Mean.[X,Y,Z,Magnitude]

Mean of linear accelaration jerk signal. (X, Y, Z components and magnitude)

#### Body.Acceleration.Jerk.StdDev.[X,Y,Z,Magnitude]

Standard deviation of linear accelaration jerk signal. (X, Y, Z components and magnitude)

#### Body.Gyroscope.Jerk.Mean.[X,Y,Z,Magnitude]

Mean of angular velocity jerk signal. (X, Y, Z components and magnitude)

#### Body.Gyroscope.Jerk.StdDev.[X,Y,Z,Magnitude]

Standard deviation of angular velocity jerk signal. (X, Y, Z components and magnitude)


### Fast Fourier Transfomed signals

The following frequency domain signals were calculated by applying a Fast Fourier Transform to the above signals.

#### FFT.Body.Acceleration.Jerk.Mean.[X,Y,Z,Magnitude]

Mean of FFT body jerk signal. (X, Y, Z components and magnitude)

#### FFT.Body.Acceleration.Jerk.StdDev.[X,Y,Z,Magnitude]

Standard deviation of FFT body jerk signal. (X, Y, Z components and magnitude)

#### FFT.Body.Acceleration.Mean.[X,Y,Z,Magnitude]

Mean of FFT body acceleration signal. (X, Y, Z components and magnitude)

#### FFT.Body.Acceleration.StdDev.[X,Y,Z,Magnitude]

Standard deviation of FFT body acceleration signal. (X, Y, Z components and magnitude)

#### FFT.Body.Gyroscope.Jerk.Mean.Magnitude

Mean of FFT angular velocity jerk signal. (X, Y, Z components and magnitude)

#### FFT.Body.Gyroscope.Jerk.StdDev.Magnitude

Standard deviation of FFT angular velocity jerk signal. (X, Y, Z components and magnitude)

#### FFT.Body.Gyroscope.Mean.[X,Y,Z,Magnitude]

Mean of FFT angular velocity signal. (X, Y, Z components and magnitude)

#### FFT.Body.Gyroscope.StdDev.[X,Y,Z,Magnitude]

Standard deviation of FFT angular velocity signal. (X, Y, Z components and magnitude)

