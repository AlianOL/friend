//
//  BaseObject.h
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/22.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface BaseObject : NSObject<YYModel,NSCopying,NSCoding>
+ (instancetype)modelWithJSON:(id)json;
/// 字典转模型
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;
/// json-array 转换为 模型数组
+ (NSArray *)modelArrayWithJSON:(id)json;


/// 将 Model 转换为 JSON 对象
- (id)toJSONObject;
/// 将 Model 转换为 NSData
- (NSData *)toJSONData;
/// 将 Model 转换为 JSONString
- (NSString *)toJSONString;



// Returns the keys for all @property declarations, except for `readonly`
// properties without ivars, or properties on MHObject itself.
/// 返回所有@property声明的属性，除了只读属性，以及属性列表不包括成员变量
+ (NSSet *)propertyKeys;

// A dictionary representing the properties of the receiver.

// The default implementation combines the values corresponding to all
// +propertyKeys into a dictionary, with any nil values represented by NSNull.
// This property must never be nil.
@property (nonatomic, copy, readonly) NSDictionary *dictionaryValue;

// Merges the value of the given key on the receiver with the value of the same
// key from the given model object, giving precedence to the other model object.
//
// By default, this method looks for a `-merge<Key>FromModel:` method on the
// receiver, and invokes it if found. If not found, and `model` is not nil, the
// value for the given key is taken from `model`.
- (void)mergeValueForKey:(NSString *)key fromModel:(BaseObject *)model;

// Merges the values of the given model object into the receiver, using
// -mergeValueForKey:fromModel: for each key in +propertyKeys.
//
// `model` must be an instance of the receiver's class or a subclass thereof.
- (void)mergeValuesForKeysFromModel:(BaseObject *)model;

@end

NS_ASSUME_NONNULL_END
