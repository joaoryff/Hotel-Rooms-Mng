//
//  Project.h
//  FinalProject
//
//  Created by english on 2019-11-28.
//  Copyright © 2019 Juliana and Joao. All rights reserved.
//

#ifndef Project_h
#define Project_h

@interface Person : NSObject

@property int pId;

@property  NSString *firstName, *lastName, *password;

-(void)printPersonData;

@end


@interface Customer : Person

@property int streetNo;

@property NSString *streetName, *city, *zipCode;


-(void)printCustomerData;

@end


@interface Room : NSObject

@property int rNumber, stat;

@property NSString *rType;

@property float rPrice;



-(void)printRoomData;

-(void)setRoomData: (int) n :(NSString *) t :(int) s :(float) p;

@end


@interface Service : NSObject @property NSString *sType; @property float sPrice;

-(void)printServiceData;

-(void)setServiceData: (NSString *) t :(float) p;

@end



@interface Reservation : NSObject
@property int cId, rNumber;
@property NSString *sType;
@property float rPrice, sPrice;
@property NSDate *checkIn, *checkOut;



-(void)printReservationData;

-(void)setReservationData: (int) ci: (int) rn: (NSString *)st: (float) rp: (float)sp : (NSDate *) ckI : (NSDate *) ckO ;

@end

@interface WaitList: NSObject @property int cNo; @property NSString *rType;

-(void)printWLData;
-(void)setWLData: (int) cNo: (NSString *) rt;
@end




#endif /* Project_h */
