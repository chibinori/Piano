//
//  ViewController.m
//  Piano
//
//  Created by 酒井紀明 on 2015/12/07.
//  Copyright © 2015年 noriaki.sakai. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (strong, nonatomic) NSArray *soundTable;
@property (strong, nonatomic) AVAudioPlayer *player;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.soundTable = @[@"C", @"C#", @"D", @"D#", @"E", @"F", @"F#", @"G", @"G#", @"A", @"A#", @"B", @"C'"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushKeyboard:(id)sender {
    
    [self playSound:self.soundTable[[sender tag]-1]];
}

- (void)playSound:(NSString*)scaleName
{
    //音楽ファイル名を作成
    NSString *soundFileName = [NSString stringWithFormat:@"piano_%@",scaleName];
    //音楽ファイルのファイルパス(音楽ファイルがデータ上どこにあるか)を作成
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:soundFileName ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    //エラーを受け取る変数の準備
    NSError *error = nil;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (error != nil) { //エラーがあった場合
        return;
    }
    [self.player play];
}

@end
