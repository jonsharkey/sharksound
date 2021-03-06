//
//  AppleSoundController.mm
//  SharkSound
//
//  Created by Jon Sharkey on 2009-10-21.
//  Copyright 2009 Sharkable. All rights reserved.
//

#include "sharksound/apple/AppleSoundController.h"

#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import <TargetConditionals.h>

#include "sharksound/apple/AppleSound.h"

using namespace SharkSound;

AppleSoundController::AppleSoundController() : SoundController() {
#if TARGET_OS_IPHONE
  // Allow background audio to keep playing.
  [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
#endif
}


#pragma mark - private

Sound * AppleSoundController::CreateSound(const std::string &filename) {
  AppleSound *sound = new AppleSound(this);
  if (sound->Init(filename)) {
    return sound;
  }
  delete sound;
  return NULL;
}
