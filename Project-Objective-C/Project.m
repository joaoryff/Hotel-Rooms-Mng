//
//  Project.m
//  FinalProject
//
//  Created by english on 2019-11-28.
//  Copyright © 2019 Juliana and Joao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"

@implementation Person

@synthesize pId, firstName, lastName, password;


-(void)printPersonData{
    
    NSLog(@"\nID: %i \nFirst Name: %@ \nLast Name: %@ \nPassword: %@", pId, firstName, lastName, password);
    
}
@end

@implementation Customer

@synthesize streetNo, streetName, city, zipCode;


-(void)printCustomerData

{
    
    NSLog(@"\n Address: %i %@, %@, %@", streetNo, streetName, city, zipCode);
    
}

@end

@implementation Room

@synthesize rNumber, stat, rType, rPrice;



-(void)printRoomData

{
    
    NSLog(@"\nRoom List \nRoom Number: %i \nType: %@ \nStatus: %i \nPrice: %.2f ", rNumber, rType, stat, rPrice);
    
};


-(void) setRoomData :(int) n :(NSString *) t :(int) s :(float) p {
    
    rNumber = n;
    rType = t;
    stat = s;
    rPrice = p;
    
};

@end

@implementation Service @synthesize sType, sPrice;

-(void)printServiceData

{
    
    NSLog(@"\nService List \nType: %@ \nPrice: %.2f ", sType, sPrice);
    
};


-(void) setServiceData :(NSString *) t :(float) p {
    
    sType = t;
    sPrice = p;
    
};

@end

@implementation Reservation @synthesize cId, rNumber, sType, rPrice, sPrice, checkIn, checkOut;


-(void)printReservationData

{
    
    NSLog(@"\nReservation \nClient Id: %i \nRoom number: %i \nService Type: %@ \nRoom Price: %.2f \nService Price: %.2f \nCheckIn : %@ \nCheckOut : %@", cId, rNumber, sType, rPrice, sPrice, checkIn, checkOut);
    
};

-(void)setReservationData: (int) ci: (int) rn: (NSString *) st :(float) rp: (float) sp :(NSDate *) ckI : (NSDate *) ckO {
    
    cId = ci;
    rNumber = rn;
    sType = st;
    rPrice = rp;
    sPrice = sp;
    checkIn = ckI;
    checkOut = ckO;
    
};
@end

@implementation WaitList @synthesize cNo, rType;

-(void)printWLData

{
    NSLog(@"\nWaiting List \nClient Id: %i \nRoom Type: %@ ", cNo, rType);
    
};

-(void)setWLData: (int) cid :(NSString *) rt  {
    
    cNo = cid;
    rType = rt;
    
};

@end

