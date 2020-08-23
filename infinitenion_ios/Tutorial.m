//
//  Tutorial.m
//  infinitenion_ios
//
//  Created by 田中健策 on 2020/08/23.
//  Copyright © 2020 Kensaku Tanaka. All rights reserved.
//

#import "Tutorial.h"

@interface Tutorial()
@property (nonatomic) NSArray<NSString *> *tutorials;
@property (nonatomic) NSInteger index;
@end

@implementation Tutorial

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tutorials = @[
            @"逆ポーランド記法では「1 1 +」のように演算子を後ろに置きます。",
            @"普通なら「(1 + 2) * (3 + 4)」と括弧が必要な計算も「1 2 + 3 4 + *」と括弧なしで書けます。",
            @"「e1」は一つ目の虚数単位、つまり高校で習った複素数の「i」です。「e1 e1 *」は「-1」になります。",
            @"「1 e1 + 1 e1 + *」を計算すると「2 e1 *」になります。これは普通の複素数の書き方では「(1 + i)^2 = 2i」になります",
            @"「e2」は2番目の、「e100」は100番目の、「e10000」は10000番目の虚数単位です。どれも自分とかけると「-1」になります。",
            @"「e2 e3」は四元数の「j k」にあたります。「e1 e2 *」は「e3」、「e2 e1 *」は「-1 e3 *」となり、四元数が可換的でないことがわかります。四元数は空間の回転を表すことに使え、空間の回転もまた可換的ではありません。",
            @"「1」「e1」から「e7」を基底とするベクトル空間は八元数と呼ばれます。「e1 e3 * e6 *」が「e4」になり、「e1 e3 e6 * *」が「-1 e4 *」になることからもわかるように結合則を満たしていません。代わりにこれは交代代数と呼ばれるものになっています。",
            @"「e3 e10 + e6 e15 - *」を計算すると「0」になります。ここから十六元数が零因子を持つことがわかります。これにより十六元数はノルム多元体にはなりません。",
            @"この計算機では任意の2^n元体の計算が確かめられます。無限次元の広野へと冒険の旅に出ましょう。"
        ];
        self.index = 0;
    }
    return self;
}

- (void)showTutorial:(UIViewController *)context {
    NSUserDefaults *ud = NSUserDefaults.standardUserDefaults;
    BOOL tutorialNotShowing = [ud boolForKey:@"tutorialNotShowing"];
    if (tutorialNotShowing) {
        return;
    }
    NSString *title = [NSString stringWithFormat:@"チュートリアル（%ld/%ld）", self.index+1, self.tutorials.count];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:self.tutorials[self.index]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                 style:UIAlertActionStyleDefault
                                               handler:nil];
    [alert addAction:ok];
    UIAlertAction *nomore = [UIAlertAction actionWithTitle:@"もう表示しない"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction *action) {
        [ud setBool:YES forKey:@"tutorialNotShowing"];
    }];
    [alert addAction:nomore];
    [context presentViewController:alert animated:YES completion:nil];
    self.index = (self.index + 1) % self.tutorials.count;
}

@end
