#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#include <stdio.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Initialize the motion manager
        CMMotionManager *motionManager = [[CMMotionManager alloc] init];
        
        if (!motionManager.isAccelerometerAvailable) {
            printf("Accelerometer is not available.\n");
            return 1;
        }
        
        // Set up accelerometer updates
        [motionManager startAccelerometerUpdates];
        
        NSUInteger counter = 0;
        
        // Read accelerometer data and log it every 100 ms
        while (counter < 1000) {
            CMAcceleration acceleration = motionManager.accelerometerData.acceleration;
            printf("X: %f, Y: %f, Z: %f\n", acceleration.x, acceleration.y, acceleration.z);
            counter++;

            [NSThread sleepForTimeInterval:0.1];
        }
        
        // Stop accelerometer updates
        [motionManager stopAccelerometerUpdates];
    }
    return 0;
}
