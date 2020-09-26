//
//  Car+CoreDataProperties.m
//  ZJJCoreDataPackage
//
//  Created by admin on 2020/9/25.
//
//

#import "Car+CoreDataProperties.h"

@implementation Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Car"];
}

@dynamic price;
@dynamic type;

@end
