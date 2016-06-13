//
//  CityViewController.m
//  ZhonghuaDistrict
//
//  Created by Darktt on 2016/6/8.
//  Copyright © 2016年 Darktt. All rights reserved.
//

#import "CityViewController.h"
#import "ZHDistrictManager.h"
#import "DistrictViewController.h"

@interface CityViewController ()

@property (assign, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:@"縣市"];
}

- (void)dealloc
{
    [self setCities:nil];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    DistrictViewController *districtViewController = segue.destinationViewController;
    [districtViewController setDistricts:sender];
}

#pragma mark - UITableView DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSInteger index = indexPath.row;
    ZHCity *city = self.cities[index];
    
    UITableViewCellAccessoryType accessoryType = UITableViewCellAccessoryNone;
    
    if (city.districts != nil) {
        accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    [cell setAccessoryType:accessoryType];
    [cell.textLabel setText:city.name];
    
    return cell;
}

#pragma mark UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger index = indexPath.row;
    ZHCity *city = self.cities[index];
    
    if (city.districts != nil) {
        [self performSegueWithIdentifier:@"District" sender:city.districts];
    }
}


@end
