//
//  PBXShellScriptBuildPhase.h
//  ExtraBuildPhase
//
//  Created by 野村 憲男 on 11/8/15.
//
//  Copyright (c) 2015 Norio Nomura
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#ifndef PBXShellScriptBuildPhase_h
#define PBXShellScriptBuildPhase_h

#import "PBXBuildPhase.h"

@protocol PBXShellScriptBuildPhase <PBXBuildPhase>

- (id)initWithName:(NSString*)name;
- (void)setShowEnvVarsInLog:(BOOL)arg1;
- (BOOL)showEnvVarsInLog;
- (void)setOutputPaths:(NSArray<NSString*>*)paths;
- (id)outputPaths;
- (void)setInputPaths:(NSArray<NSString*>*)paths;
- (id)inputPaths;
- (void)setShellScript:(NSString*)script;
- (id)shellScript;
- (void)setShellPath:(NSString*)path;
- (id)shellPath;

@end

#endif /* PBXShellScriptBuildPhase_h */
