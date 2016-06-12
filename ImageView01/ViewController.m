//
//  ViewController.m
//  ImageView01
//
//  Created by wxweven on 16/5/3.
//  Copyright © 2016年 wxweven. All rights reserved.
//

#import "ViewController.h"
#import "ImageModel.h"

@interface ViewController ()

@property (assign,nonatomic) int index;
@property (strong,nonatomic) NSArray *images;

@property (weak, nonatomic) IBOutlet UILabel *noLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;


@property (weak, nonatomic) IBOutlet UIImageView *imageShow;


@property (weak, nonatomic) IBOutlet UIButton *preBtn;


@property (weak, nonatomic) IBOutlet UIButton *nextBtn;




- (IBAction)previous;

- (IBAction)next;

@end

@implementation ViewController

- (void)viewDidLoad {
    [self changeData];
}


-(NSArray *) images{
    if(_images ==nil){
        /*NSMutableDictionary *dict1 =[NSMutableDictionary dictionary];
        dict1[@"icon"] = @"image1";
        dict1[@"desc"] = @"帅帅的警察~~";
        
        NSMutableDictionary *dict2 =[NSMutableDictionary dictionary];
        dict2[@"icon"] = @"image2";
        dict2[@"desc"] = @"美丽的蓝花朵";
        
        NSMutableDictionary *dict3 =[NSMutableDictionary dictionary];
        dict3[@"icon"] = @"image3";
        dict3[@"desc"] = @"博士一枚";
        
        NSMutableDictionary *dict4 =[NSMutableDictionary dictionary];
        dict4[@"icon"] = @"image4";
        dict4[@"desc"] = @"粉色桃心";
        
        NSMutableDictionary *dict5 =[NSMutableDictionary dictionary];
        dict5[@"icon"] = @"image5";
        dict5[@"desc"] = @"两只小兔纸";
        
        _images = @[dict1,dict2,dict3,dict4,dict5];*/
        
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"image.plist" ofType:nil];
        
        //_images = [NSArray arrayWithContentsOfFile:path];
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        //字典转模型
        
        NSMutableArray *tempArray =[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            ImageModel *imageModel1 = [[ImageModel alloc] init];
            
            imageModel1.icon = dict[@"icon"];
            imageModel1.desc = dict[@"desc"];
            [tempArray addObject:imageModel1];
        }
        _images = tempArray;
        
    }
    return _images;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)previous {
    self.index --;
    [self changeData];
    
}

- (IBAction)next {
    self.index ++;
    [self changeData];
    
}

-(void) changeData{
    
    self.noLabel.text = [NSString stringWithFormat:@"%d/%ld",self.index + 1,self.images.count];
    
   
    
    ImageModel *imgModel = self.images[self.index];
    self.imageShow.image = [UIImage imageNamed:imgModel.icon];
    self.descLabel.text = imgModel.desc;
    
    
    /*
    NSDictionary *dict =self.images[self.index];
    self.imageShow.image = [UIImage imageNamed:dict[@"icon"]];
    self.descLabel.text = dict[@"desc"];
     */
    
    self.preBtn.enabled = (self.index != 0);
    self.nextBtn.enabled = (self.index != self.images.count - 1);
    
}
@end
