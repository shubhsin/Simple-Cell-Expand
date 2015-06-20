//
//  ViewController.m
//  DemoProj
//
//  Created by Shubham Sorte on 19/06/15.
//  Copyright (c) 2015 Shubham Sorte. All rights reserved.
//

#import "ViewController.h"
#import "DemoTableViewCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSIndexPath *selectedCellIndexPath;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table View

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSIndexPath *previousSelectedIndexPath = selectedCellIndexPath;  // <- save previously selected cell
    selectedCellIndexPath = indexPath;
    if (previousSelectedIndexPath) { // <- reload previously selected cell (if not nil)
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:previousSelectedIndexPath]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:selectedCellIndexPath]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(selectedCellIndexPath != nil
       && [selectedCellIndexPath compare:indexPath] == NSOrderedSame)
        return 100;
    
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"Cell";
    
    DemoTableViewCell * cell = (DemoTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"DemoTableViewCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    return cell;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * blankView = [[UIView alloc]initWithFrame:CGRectZero];
    
    return blankView;
}

@end
