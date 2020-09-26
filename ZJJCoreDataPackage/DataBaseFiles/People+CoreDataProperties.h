//
//  People+CoreDataProperties.h
//  ZJJCoreDataPackage
//
//  Created by admin on 2020/9/25.
//
//

#import "People+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface People (CoreDataProperties)

+ (NSFetchRequest<People *> *)fetchRequest;

@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) BOOL sex;

@end

NS_ASSUME_NONNULL_END
