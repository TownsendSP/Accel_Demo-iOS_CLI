#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#include <stdio.h>
int main(int argc, const char* argv[])
{
    @autoreleasepool {
        int lastFacing = 0;
        int facing = 0;
        printf("Starting accelerometer updates...\n");
        // Initialize the motion manager
        CMMotionManager* motionManager = [[CMMotionManager alloc] init];
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
        if (fabs(acceleration.x) > 4 || fabs(acceleration.y) > 4 || fabs(acceleration.z) > 4) {
            printf("Stop shaking the phone\t Raw: X: %f, Y: %f, Z: %f\n", acceleration.x, acceleration.y, acceleration.z);
        } else if (acceleration.z > 0.8) {
            printf("Screen is facing Down\t Raw: X: %f, Y: %f, Z: %f\n", acceleration.x, acceleration.y, acceleration.z);
        } else if (acceleration.z < -0.8) {
            printf("Screen is facing Up\t Raw: X: %f, Y: %f, Z: %f\n", acceleration.x, acceleration.y, acceleration.z);
        } else if (acceleration.x > 0.8) {
            printf("Screen is facing Right\t Raw: X: %f, Y: %f, Z: %f\n", acceleration.x, acceleration.y, acceleration.z);
        } else if (acceleration.x < -0.8) {
            printf("Screen is facing Left\t Raw: X: %f, Y: %f, Z: %f\n", acceleration.x, acceleration.y, acceleration.z);
        } else if (acceleration.y > 0.8) {
            printf("Screen is facing Forwards\t Raw: X: %f, Y: %f, Z: %f\n", acceleration.x, acceleration.y, acceleration.z);
        } else if (acceleration.y < -0.8) {
            facing = 7;
            if(facing != lastFacing) {
                printf("Screen is facing Backwards\t Raw: X: %f, Y: %f, Z: %f\n", acceleration.x, acceleration.y, acceleration.z);
              lastFacing = facing;
            }
        } else {
                printf("Screen is facing Unknown\t Raw: X: %f, Y: %f, Z: %f\n", acceleration.x, acceleration.y, acceleration.z);
            }
        }
        
        counter++;
        
        [NSThread sleepForTimeInterval:0.1];
    } // Stop accelerometer updates
    [motionManager stopAccelerometerUpdates];
}
return 0;
}
