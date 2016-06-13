//
//  ViewController.m
//  ZhonghuaDistrict
//
//  Created by Darktt on 2016/6/8.
//  Copyright © 2016年 Darktt. All rights reserved.
//

#import "ViewController.h"

#import "ZHDistrictManager.h"

#import "StateViewController.h"
#import "CityViewController.h"
#import "DistrictViewController.h"

@interface ViewController ()

@property (assign, nonatomic) IBOutlet UITableView *tableView;
@property (retain) NSArray<NSString *> *countries;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"國家"];
    
    NSArray *countries = @[@"中華人民共和國(大陸)", @"中華民國(台灣)", @"香港", @"澳門"];
    
    [self setCountries:countries];
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
    
    if ([segue.identifier isEqualToString:@"State"]) {
        StateViewController *stateViewController = segue.destinationViewController;
        [stateViewController setStates:sender];
    }
    
    if ([segue.identifier isEqualToString:@"City"]) {
        CityViewController *cityViewController = segue.destinationViewController;
        [cityViewController setCities:sender];
    }
    
    if (![segue.identifier isEqualToString:@"District"]) {
        return;
    }
    
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
    return self.countries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    NSInteger index = indexPath.row;
    NSString *country = self.countries[index];
    
    [cell.textLabel setText:country];
    
    return cell;
}

#pragma mark UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger index = indexPath.row;
    
    NSString *identifier = nil;
    NSArray *sender = nil;
    
    switch (index) {
        case 0:
            identifier = @"State";
            sender = [ZHDistrictManager chinaStates];
            break;
            
        case 1:
            identifier = @"City";
            sender = [ZHDistrictManager taiwanCities];
            break;
            
        case 2:
            identifier = @"City";
            sender = [ZHDistrictManager hongKongCities];
            break;
            
        case 3:
            identifier = @"District";
            sender = [ZHDistrictManager macauDistricts];
            break;
            
        default:
            identifier = @"State";
            sender = [ZHDistrictManager chinaStates];
            break;
    }
    
    [self performSegueWithIdentifier:identifier sender:sender];
}

@end
