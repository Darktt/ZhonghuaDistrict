//
//  StateViewController.m
//  ZhonghuaDistrict
//
//  Created by Darktt on 2016/6/8.
//  Copyright © 2016年 Darktt. All rights reserved.
//

#import "StateViewController.h"
#import "ZHDistrictManager.h"

#import "CityViewController.h"

@interface StateViewController ()

@property (assign, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation StateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:@"省"];
}

- (void)dealloc
{
    [self setStates:nil];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    CityViewController *cityViewController = segue.destinationViewController;
    [cityViewController setCities:sender];
}

#pragma mark - UITableView DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.states.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSInteger index = indexPath.row;
    ZHState *state = self.states[index];
    
    UITableViewCellAccessoryType accessoryType = UITableViewCellAccessoryNone;
    
    if (state.cities != nil) {
        accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    [cell setAccessoryType:accessoryType];
    [cell.textLabel setText:state.name];
    
    return cell;
}

#pragma mark UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger index = indexPath.row;
    ZHState *state = self.states[index];
    
    if (state.cities != nil) {
        [self performSegueWithIdentifier:@"City" sender:state.cities];
    }
}


@end
