//
//  People+CoreDataProperties.m
//  ZJJCoreDataPackage
//
//  Created by admin on 2020/9/25.
//
//

#import "People+CoreDataProperties.h"

@implementation People (CoreDataProperties)

+ (NSFetchRequest<People *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"People"];
}

@dynamic age;
@dynamic name;
@dynamic sex;

@end
