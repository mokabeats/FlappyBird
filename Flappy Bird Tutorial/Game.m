//
//  Game.m
//  Flappy Bird Tutorial
//
//  Created by Milos Mokic on 12/13/15.
//  Copyright © 2015 Milos Mokic. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end


@implementation Game

-(void)Score{
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
}

-(void)GameOver{
    if (ScoreNumber > HighScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelBotton.hidden = YES;
    Top.hidden = YES;
    Bottom.hidden = YES;
    Bird.hidden = YES;
} 

-(IBAction)StartGame:(id)sender
{
    TunnelTop.hidden = NO;
    TunnelBotton.hidden = NO;
    
    StartGame.hidden = YES;

    BirdMovement = [NSTimer scheduledTimerWithTimeInterval: 0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
}

-(void)TunnelMoving{
    TunnelTop.center = CGPointMake(TunnelTop.center.x - 1, TunnelTop.center.y);
    TunnelBotton.center = CGPointMake(TunnelBotton.center.x - 1, TunnelBotton.center.y);
    
    if (TunnelTop.center.x < -28){
        [self PlaceTunnels];
    }
    
    if (TunnelTop.center.x == 7){
        [self Score];
    }
    
    if(CGRectIntersectsRect(Bird.frame, TunnelTop.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bird.frame, TunnelBotton.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bird.frame, Top.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bird.frame, Bottom.frame)){
        [self GameOver];
    }
}

-(void)PlaceTunnels{
    RandomTopTunnelPosition = arc4random() %350;
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 665;
    
    TunnelTop.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelBotton.center = CGPointMake(340, RandomBottomTunnelPosition);
}

-(void)BirdMoving{
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 5;

    if (BirdFlight < - 15) {
        BirdFlight = -15;
    }
    
    if (BirdFlight > 0){
        Bird.image = [UIImage imageNamed:@"BirdUp.png"];
    }
    
    if (BirdFlight < 0){
        Bird.image = [UIImage imageNamed:@"BirdDown.png"];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    BirdFlight = 30;
    
}

- (void)viewDidLoad {
    TunnelTop.hidden = YES;
    TunnelBotton.hidden = YES;
    
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
