//
//  ViewController.m
//  02.自动布局子视图
//
//  Created by Hades on 2017/11/18.
//  Copyright © 2017年 Hades. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _superView = [[UIView alloc]init];
    _superView.frame = CGRectMake(20, 20, 180, 280);
    _superView.backgroundColor =[UIColor blueColor];
    
    _label01 = [[UILabel alloc]init];
    //位置相对于父视图
    _label01.frame = CGRectMake(0, 0, 40, 40);
    _label01.text = @"1";
    _label01.backgroundColor = [UIColor greenColor];
    
    _label02 = [[UILabel alloc]init];
    _label02.frame = CGRectMake(180-40, 0, 40, 40);
    _label02.text = @"2";
    _label02.backgroundColor = [UIColor greenColor];
    
    _label03 = [[UILabel alloc]init];
    _label03.frame = CGRectMake(180-40, 280-40, 40, 40);
    _label03.text = @"3";
    _label03.backgroundColor = [UIColor greenColor];
    
    _label04 = [[UILabel alloc]init];
    _label04.frame = CGRectMake(0, 280-40, 40, 40);
    _label04.text = @"4";
    _label04.backgroundColor = [UIColor greenColor];
    
    [_superView addSubview:_label01];
    [_superView addSubview:_label02];
    [_superView addSubview:_label03];
    [_superView addSubview:_label04];
    
    [self.view addSubview:_superView];
    
    _viewCenter = [[UIView alloc]init];
    _viewCenter.frame = CGRectMake(0, 0, _superView.bounds.size.width, 40);
    
    _viewCenter.center = CGPointMake(180/2, 280/2);
    _viewCenter.backgroundColor = [UIColor orangeColor];
    
    [_superView addSubview:_viewCenter];
    //动画效果
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    //自动布局，设置距离相对父视图的左右上下边距的比例变化，边长也相对父视图的比例变化
    //右上角子视图，左侧变化了，其他没变
    _label02.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    //右下角子视图，左侧上侧变化
    _label03.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin;
    //左下角子视图，上侧变化
    _label04.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    //中间子视图，宽度变化，上下侧都变化
    _viewCenter.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    //动画结束
    [UIView commitAnimations];
    
    
    

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static BOOL isLarge = NO;
    //开始动画
    [UIView beginAnimations:nil context:nil];
    //动画时间
    [UIView setAnimationDuration:1];
    
    if(isLarge == NO)
    {
        //touch触发变大事件
        _superView.frame = CGRectMake(10, 10, 300, 400);
    }
    else
    {
        //触发变小事件
        _superView.frame = CGRectMake(20, 20, 180, 280);
    }
    //结束时修改isLarge值
    isLarge = !isLarge;
    //动画结束
    [UIView commitAnimations];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
