//
//  RMMAppDelegate.h
//  TDD
//
//  Created by Ricardo Maqueda on 02/07/14.
//  Copyright (c) 2014 Molestudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
