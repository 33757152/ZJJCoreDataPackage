//
//  Car+CoreDataProperties.h
//  ZJJCoreDataPackage
//
//  Created by admin on 2020/9/25.
//
//

#import "Car+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest;

@property (nonatomic) int16_t price;
@property (nullable, nonatomic, copy) NSString *type;

@end

NS_ASSUME_NONNULL_END
