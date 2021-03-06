//

//  main.m

//  FinalProject

//

//  Created by english on 2019-11-14.

//  Copyright © 2019 Juliana and Joao. All rights reserved.

//

#import <Foundation/Foundation.h>
#import "Project.h"



int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
    
        Room * r1 = [[Room alloc] init];
        Room * r2 = [[Room alloc] init];
        Room * r3 = [[Room alloc] init];
        
        [ r1 setRoomData:1 :@"single" :1:50.00];
        [ r2 setRoomData:2 :@"double" :0:90.00];
        [ r3 setRoomData:3 :@"triple" :1:125.00];
        
        NSArray * arrRoom = [NSArray arrayWithObjects :r1, r2, r3, nil ];
        
        Service * s1 = [[Service alloc] init];
        Service * s2 = [[Service alloc] init];
        Service * s3 = [[Service alloc] init];
        
        [ s1 setServiceData:@"Internet" :15.00];
        [ s2 setServiceData:@"Sauna" :10.00];
        [ s3 setServiceData:@"Fitness Center":20.00];
        
        NSArray * arrService = [NSArray arrayWithObjects :s1, s2, s3, nil ];
        
        NSMutableArray <Reservation *> *arrReservation;
        NSMutableArray <Customer *> *arrCustomer;
        NSMutableArray<WaitList *> *arrWaitList;
        
        Customer *c1 = [[Customer alloc] init];
        Reservation *rs1 = [[Reservation alloc] init];
        WaitList *wl1=[[WaitList alloc]init];
        
        
        NSDateFormatter* df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd"];
        NSDate *dateA = [NSDate date];
        NSDate *dateB = [NSDate date];
        
        
        int option;
        int enteredId;
        int enteredRoom;
        char enteredFirstName[50];
        char enteredLastName[50];
        int enteredStreetNo;
        char enteredStreetName[50];
        char enteredCity[50];
        char enteredZC[50];
        char enteredPassword[50];
        char enteredService[50];
        
        
        NSString *str1;
        NSString *str2;
        NSString *str3;
        NSString *str4;
        NSString *str5;
        NSString *str6;
        NSString *str7;

        
        
        do {

            NSLog(@"Welcome to July's Hotel. Tap 1 to create your profile, 2 to make a reservation, 3 to display and 4 to exit:");
            scanf("%i",&option);
           switch (option) {
                    
                case 1:
               {
                    NSLog(@"Enter Id:");
                    scanf("%i",&enteredId);

                    NSLog(@"Enter First Name:");
                    scanf("%s",enteredFirstName);
                   
                    str1 = [NSString stringWithCString:enteredFirstName encoding:1];
                   
                    NSLog(@"Enter Last Name:");
                    
                    scanf("%s",enteredLastName);
                    
                    str2 = [NSString stringWithCString:enteredLastName encoding:1];
                   
                    NSLog(@"Enter Street Number:");
                    
                    scanf("%i",&enteredStreetNo);
                    
                    NSLog(@"Enter Street Name:");
                    
                    scanf("%s",enteredStreetName);
                    
                    str3 = [NSString stringWithCString:enteredStreetName encoding:1];
                    
                    NSLog(@"Enter City:");
                    
                    scanf("%s",enteredCity);
                    
                    str4 = [NSString stringWithCString:enteredCity encoding:1];
                   
                    NSLog(@"Enter Zip Code:");
                    
                    scanf("%s",enteredZC);
                    
                    str5 = [NSString stringWithCString:enteredZC encoding:1];
                   
                    NSLog(@"Enter Password:");
                    
                    scanf("%s",enteredPassword);
                    
                    str6 = [NSString stringWithCString:enteredPassword encoding:1];
                   
                    c1.pId = enteredId;
                    c1.firstName=str1;
                    c1.lastName=str2;
                    c1.streetNo = enteredStreetNo;
                    c1.streetName = str3;
                    c1.city = str4;
                    c1.zipCode = str5;
                    c1.password=str6;
                    
                    [arrCustomer addObject :c1];

                    int yORn=1;
                    
                    NSLog(@"do you want to do a reservation  choose:\n(1) YES (2) NO");
                    
                    scanf("%i",&yORn);
                    
                    if (yORn==1) {
                        
                        
                        NSLog(@"Choose a room from the following list:");
                        
                        [r1 printRoomData];
                        [r2 printRoomData];
                        [r3 printRoomData];
                        
                        int aStroom=0;
                        int temp, aRPrice;
                        
                        do {
                            
                            scanf("%i",&enteredRoom);
                            
                            temp=enteredRoom;
                            
                           for (int i = 0; i < [arrRoom count]; i++) {
                                
                                if ( (1+i)==temp) {
                                    
                                    NSLog(@"%i",[arrRoom[i] stat]);
                                    aStroom =[arrRoom[i] stat];
                                    aRPrice=[arrRoom[i] rPrice];
                                    
                                }
                            }
                            
                            if (aStroom==0) {
                                
                                NSLog(@"Romm unavaliable, choose other");
                                
                                NSLog(@"Your name was included in the wait list for this Type room");
                                
                                wl1.cNo = enteredId;
                                

                                for (int i = 0; i < [arrRoom count]; i++) {
                                    
                                    if (   [arrRoom[i] rNumber] ==temp ) {
                                        
                                        wl1.rType=[arrRoom[i] rType];
                                      
                                    }
                                }
                                
                                [arrWaitList addObject :wl1];
                                
                                [wl1 printWLData];
                                
                                
                                
                            }
                            
                        } while (aStroom==0);
                       
                        NSLog(@"Choose a service from the following list:");
                        
                        [s1 printServiceData];
                        [s2 printServiceData];
                        [s3 printServiceData];
                        
                        scanf("%s",enteredService);
                        
                        str7 = [NSString stringWithCString:enteredService encoding:1];
                        int aSprice;
                        
                        for (int i = 0; i < [arrService count]; i++) {
                            
                            if (   [[arrService[i] sType] isEqualToString:str7 ]) {
                                aSprice=[arrService[i] sPrice];
                                
                            }
                          
                        }
                        
                        int total, days;
                        
                        NSLog(@"How many days are you stay ");
                        
                        scanf("%i",&days);
                        
                        NSDateComponents *leGap = [[NSDateComponents alloc] init];
                        [leGap setDay:days];
                        NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:leGap                                                                                        toDate:dateB options:0];
                        
                        total=(aRPrice+aSprice)*days;
                        
                        rs1.cId = enteredId;
                        rs1.rNumber = enteredRoom;
                        rs1.sType = str7;
                        rs1.rPrice = aRPrice;
                        rs1.sPrice=aSprice;
                        rs1.checkIn = dateB;
                        rs1.checkOut = newDate;
                        
                        
                        [arrReservation addObject :rs1];
                        
                        [rs1 printReservationData];
                        
                        NSLog(@"\nYou will pay \n total: %i",total);
                        
                    }
               }
                    break;
                    
                case 2:
               {
                    NSLog(@"Enter Id:");
                    
                    scanf("%i",&enteredId);
                    
                    NSLog(@"Choose a room from the following list:");
                    
                    [r1 printRoomData];
                    [r2 printRoomData];
                    [r3 printRoomData];
                    
                    int aStroom=0;
                    
                    int temp, aRPrice;
                    do {
                        
                        scanf("%i",&enteredRoom);
                        
                        temp=enteredRoom;  
                        
                        for (int i = 0; i < [arrRoom count]; i++) {
                            
                            if ( (1+i)==temp) {
                                
                                NSLog(@"%i",[arrRoom[i] stat]);
                                
                                aStroom =[arrRoom[i] stat];
                                
                                aRPrice=[arrRoom[i] rPrice];
                                
                            }
                            
                        }
                        
                        if (aStroom==0) {
                            
                            NSLog(@"Romm unavaliable, choose other");
                            
                            NSLog(@"Your name was included in the wait list for this Type room");
                            
                            wl1.cNo = enteredId;
                            
                            
                            
                            for (int i = 0; i < [arrRoom count]; i++) {
                                
                                if (   [arrRoom[i] rNumber] ==temp ) {
                                    
                                    wl1.rType=[arrRoom[i] rType];
                                    
                                }
                            
                            }
                            
                            [arrWaitList addObject :wl1];
                            
                            [wl1 printWLData];
                            
                        }
                        
                    } while (aStroom==0);
                    
                   NSLog(@"Choose a service from the following list:");
                    
                    [s1 printServiceData];
                    
                    [s2 printServiceData];
                    
                    [s3 printServiceData];
                    
                    scanf("%s",enteredService);
                    
                    str7 = [NSString stringWithCString:enteredService encoding:1];
                   
                    int aSprice;
                   
                    for (int i = 0; i < [arrService count]; i++) {
                        
                        if (   [[arrService[i] sType] isEqualToString:str7 ]) {
                            
                             aSprice=[arrService[i] sPrice];
                            
                        }
                       
                    }
                   
                   int total, days;
                   NSLog(@"How many days are you stay ");
                   scanf("%i",&days);
                   
                   NSDateComponents *leGap1 = [[NSDateComponents alloc] init];
                   [leGap1 setDay:days];
                   NSDate *newDate1 = [[NSCalendar currentCalendar] dateByAddingComponents:leGap1                                                                                        toDate:dateA options:0];
                   
                    
                    rs1.cId = enteredId;
                    rs1.rNumber = enteredRoom;
                    rs1.sType = str7;
                    rs1.rPrice = aRPrice;
                    rs1.sPrice=aSprice;
                    rs1.checkIn = dateA;
                    rs1.checkOut = newDate1;
                   
                    total=(aRPrice+aSprice)*days;
                  
                    [arrReservation addObject :rs1];
                    
                    [rs1 printReservationData];
                    
               NSLog(@"\nYou will pay \n total: %i",total);}
                    break;
                case 3:
               {
                    [c1 printPersonData];
                    [c1 printCustomerData];
                    [rs1 printReservationData];
                    [wl1 printWLData];
               } break;
                    
                case 4:
               {}break;
               default:
                    
                    break;
                    
            }
        } while (option !=4);
        
        NSLog(@"Application Exited");
        
    }
    
    return 0;
    
}


