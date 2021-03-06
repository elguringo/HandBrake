/*  HBPicture+UIAdditions.m $

 This file is part of the HandBrake source code.
 Homepage: <http://handbrake.fr/>.
 It may be used under the terms of the GNU General Public License. */

#import "HBPicture+UIAdditions.h"
#import "HBTitle.h"
#include "hb.h"

@implementation HBPicture (UIAdditions)

@dynamic maxHeight;
@dynamic maxWidth;

@dynamic maxHorizontalCrop;
@dynamic maxVerticalCrop;

@dynamic keepDisplayAspectEditable;

#pragma mark - Editable state

- (BOOL)isWidthEditable
{
    return (self.anamorphicMode != HB_ANAMORPHIC_STRICT) ? YES : NO;
}

- (BOOL)isHeightEditable
{
    return (self.anamorphicMode != HB_ANAMORPHIC_STRICT) ? YES : NO;
}

- (BOOL)isKeepDisplayAspectEditable
{
    if (self.anamorphicMode == HB_ANAMORPHIC_STRICT ||
        self.anamorphicMode == HB_ANAMORPHIC_LOOSE)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

- (BOOL)isCustomAnamorphicEnabled
{
    return self.anamorphicMode == HB_ANAMORPHIC_CUSTOM;
}

- (NSString *)info
{
    if (!self.title)
    {
        return @"";
    }

    NSString *sizeInfo;
    hb_title_t *title = self.title.hb_title;

    if (self.anamorphicMode == HB_ANAMORPHIC_STRICT) // Original PAR Implementation
    {
        sizeInfo = [NSString stringWithFormat:
                    @"Source: %dx%d, Output: %dx%d, Anamorphic: %dx%d Strict",
                    title->geometry.width, title->geometry.height, self.width, self.height, self.displayWidth, self.height];
    }
    else if (self.anamorphicMode == HB_ANAMORPHIC_LOOSE) // Loose Anamorphic
    {
        sizeInfo = [NSString stringWithFormat:
                    @"Source: %dx%d, Output: %dx%d, Anamorphic: %dx%d Loose",
                    title->geometry.width, title->geometry.height, self.width, self.height, self.displayWidth, self.height];
    }
    else if (self.anamorphicMode == HB_ANAMORPHIC_CUSTOM) // Custom Anamorphic
    {
        sizeInfo = [NSString stringWithFormat:
                    @"Source: %dx%d, Output: %dx%d, Anamorphic: %dx%d Custom",
                    title->geometry.width, title->geometry.height, self.width, self.height, self.displayWidth, self.height];
    }
    else // No Anamorphic
    {
        sizeInfo = [NSString stringWithFormat:
                    @"Source: %dx%d, Output: %dx%d",
                    title->geometry.width, title->geometry.height, self.width, self.height];
    }

    return sizeInfo;
}

@end
