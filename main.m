//
//  main.m
//  objective_C_test
//
//  Created by zezhi cai on 15/8/14.
//  Copyright (c) 2015年 CAI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MathOperations.h"
BOOL isAnOperator(const char value){
    return ((value=='+')||(value=='-')||(value=='*')||(value=='/'));
}
int main(int argc, char* argv[]){
    @autoreleasepool {
        double result = 0;
        char operator = '\0';
        NSString *equation = [NSString stringWithUTF8String:argv[1]];
        NSArray *eqParts = [equation componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        for(int n=0;n<[eqParts count];n++){
            NSString *argString = [eqParts objectAtIndex:n];
            char firstChar = [argString characterAtIndex:0];
            if (isAnOperator(firstChar)){
                operator = firstChar;
                continue;
            }
            double newValue = [argString doubleValue];
            switch(operator){
                case '+':
                    result=add(result,newValue);
                    break;
                case '-':
                    result=subtract(result, newValue);
                    break;
                case '*':
                    result=multiply(result, newValue);
                    break;
                case '/':
                    result=divide(result, newValue);
                    break;
                default:
                    result = add(result,newValue);
                    break;
            }
        }
        NSLog(@"%.3f",result);
    }
        return 0;
}
