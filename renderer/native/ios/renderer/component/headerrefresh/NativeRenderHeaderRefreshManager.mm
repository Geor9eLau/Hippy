/*!
 * iOS SDK
 *
 * Tencent is pleased to support the open source community by making
 * Hippy available.
 *
 * Copyright (C) 2019 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "NativeRenderHeaderRefreshManager.h"
#import "NativeRenderHeaderRefresh.h"
#import "HippyUIManager.h"

@implementation NativeRenderHeaderRefreshManager

HIPPY_EXPORT_MODULE(PullHeaderView);

HIPPY_EXPORT_VIEW_PROPERTY(onHeaderReleased, HippyDirectEventBlock)
HIPPY_EXPORT_VIEW_PROPERTY(onHeaderPulling, HippyDirectEventBlock)

HIPPY_EXPORT_METHOD(expandPullHeader:(nonnull NSNumber *)reactTag) {
    [self.bridge.uiManager addUIBlock:^(HippyUIManager *uiManager, NSDictionary<NSNumber *, __kindof UIView *> *viewRegistry) {
        HippyRefresh *refreshView = viewRegistry[reactTag];
        [refreshView refresh];
    }];
}

HIPPY_EXPORT_METHOD(collapsePullHeader:(nonnull NSNumber *)reactTag) {
    [self.bridge.uiManager addUIBlock:^(HippyUIManager *uiManager, NSDictionary<NSNumber *, __kindof UIView *> *viewRegistry) {
        HippyRefresh *refreshView = viewRegistry[reactTag];
        [refreshView refreshFinish];
    }];
}

HIPPY_EXPORT_METHOD(collapsePullHeaderWithOptions:(nonnull NSNumber *)reactTag options:(NSDictionary *)options) {
    [self.bridge.uiManager addUIBlock:^(HippyUIManager *uiManager, NSDictionary<NSNumber *, __kindof UIView *> *viewRegistry) {
        HippyRefresh *refreshView = viewRegistry[reactTag];
        [refreshView refreshFinishWithOption:options];
    }];
}

- (UIView *)view {
    return [[NativeRenderHeaderRefresh alloc] init];
}

@end
