/*  HBVideo.h $

 This file is part of the HandBrake source code.
 Homepage: <http://handbrake.fr/>.
 It may be used under the terms of the GNU General Public License. */

#import <Foundation/Foundation.h>

@class HBJob;

/**
 *  HBVideo
 */
@interface HBVideo : NSObject <NSCoding>

- (instancetype)initWithJob:(HBJob *)job;

- (void)containerChanged;

- (void)applySettingsFromPreset:(NSDictionary *)preset;
- (void)prepareVideoForPreset:(NSMutableDictionary *)preset;

- (void)applyVideoSettingsFromQueue:(NSDictionary *)queueToApply;
- (void)prepareVideoForQueueFileJob:(NSMutableDictionary *)queueFileJob;

@property (nonatomic, readwrite) int encoder;

@property (nonatomic, readwrite) int qualityType;
@property (nonatomic, readwrite) int avgBitrate;
@property (nonatomic, readwrite) double quality;

@property (nonatomic, readwrite) int frameRate;
@property (nonatomic, readwrite) int frameRateMode;

@property (nonatomic, readwrite) BOOL twoPass;
@property (nonatomic, readwrite) BOOL turboTwoPass;

/**
 *  Encoder specifics options
 */

@property (nonatomic, readwrite) BOOL advancedOptions;
@property (nonatomic, readwrite, copy) NSString *preset;
@property (nonatomic, readwrite, copy) NSString *tune;
@property (nonatomic, readwrite, copy) NSString *profile;
@property (nonatomic, readwrite, copy) NSString *level;

@property (nonatomic, readwrite, copy) NSString *videoOptionExtra;

@property (nonatomic, readwrite) BOOL fastDecode;

@property (nonatomic, readwrite, assign) HBJob *job;

@end
