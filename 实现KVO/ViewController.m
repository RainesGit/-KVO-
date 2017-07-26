//
//  ViewController.m
//  实现KVO
//
//  Created by Rainse on 2017/7/26.
//  Copyright © 2017年 Rainse. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVO.h"
@interface ViewController ()
@property (nonatomic,strong) Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 1. 自定义person类的子类
    // 2. 重写setName， 在内部恢复父类做法，通知观察这
    // 3. 如何让外界调用自定义person类子类的方法 修改当前对象的isa指针，指向自定义子类
    // isa 类指向哪个类，就去哪个类查找方法。
    
    _p = [[Person alloc] init];
//    [_p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [_p ys_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)kvo
{
    
    _p = [[Person alloc] init];
    [_p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];

}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{

    NSLog(@"%@",_p.name);
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    static int i = 0;
    i++;
    _p.name = [NSString stringWithFormat:@"boy%d",i];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
