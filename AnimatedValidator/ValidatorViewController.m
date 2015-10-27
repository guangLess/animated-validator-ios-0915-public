//
//  ValidatorViewController.m
//  AnimatedValidator
//
//  Created by Al Tyus on 5/12/14.
//  Copyright (c) 2014 al-tyus.com. All rights reserved.
//

#import "ValidatorViewController.h"
#import "Constants.h"

@interface ValidatorViewController ()<UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UITextField *emailConfirmTextField;
@property (nonatomic, weak) IBOutlet UITextField *phoneTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordConfirmTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *emailWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *submitButtonBottomCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *emailConformTextWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *phoneTextWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordButtonWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordConfirmButtonWidth;

@end

@implementation ValidatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.submitButton.accessibilityLabel = SUBMITBUTTON;
    self.emailTextField.accessibilityLabel = EMAILTEXTFIELD;
    self.emailConfirmTextField.accessibilityLabel = EMAILCONFIRMTEXTFIELD;
    self.phoneTextField.accessibilityLabel = PHONETEXTFIELD;
    self.passwordTextField.accessibilityLabel = PASSWORDTEXTFIELD;
    self.passwordConfirmTextField.accessibilityLabel = PASSWORDCONFIRMTEXTFIELD;
    
    self.submitButton.isEnabled == YES;
    self.submitButton.hidden = YES;
    
    self.passwordConfirmTextField.delegate = self;
    
}

#pragma mark - TextFieldDidEnd IBActions

-(IBAction)emailEnd:(UITextField *)sender {
    
    if (sender.text.length == 0 || (![sender.text containsString:@"@"])) {
        NSLog(@" Not valid input");
        
        [UIView animateWithDuration:1 delay:0 options:0 animations:^{
            self.emailTextField.backgroundColor = [UIColor redColor];
            self.emailWidth.constant = self.emailWidth.constant + 10;
            [self.view layoutIfNeeded];
            
        }completion:nil];}

}

- (IBAction)confirmEmailEnd:(UITextField *)sender {
    
    if (sender.text.length == 0 || (![sender.text containsString:@"@"]) || (![sender.text isEqualToString:self.emailTextField.text])) {
        
        NSLog(@" Not valid input");
        [UIView animateWithDuration:1 delay:0 options:0 animations:^{
            self.emailConfirmTextField.backgroundColor = [UIColor redColor];
            self.emailConformTextWidth.constant = self.emailConformTextWidth.constant - 30;
            [self.view layoutIfNeeded];
        }completion:nil];}

}

- (IBAction)phoneTextEnd:(UITextField *)sender {
    
    if (sender.text.intValue == 0 || (sender.text.length != 7)) {
        
        NSLog(@" Not valid input");
        [UIView animateWithDuration:1 delay:0 options:0 animations:^{
            self.phoneTextField.backgroundColor = [UIColor redColor];
            self.phoneTextWidth.constant = self.phoneTextWidth.constant + 10;
            [self.view layoutIfNeeded];
        }completion:nil];}

}

- (IBAction)passwordTextEnd:(UITextField *)sender {
    
    if (sender.text.intValue == 0 || (sender.text.length !=6) || sender.text.length == 0) {
        NSLog(@" Not valid input");
        [UIView animateWithDuration:1 delay:0 options:0 animations:^{
            self.passwordTextField.backgroundColor = [UIColor redColor];
            self.passwordButtonWidth.constant = self.passwordButtonWidth.constant + 10;
            [self.view layoutIfNeeded];
        }completion:nil];}
}

- (IBAction)confirmPasswordTextEnd:(UITextField *)sender {
    

    if ([sender.text isEqualToString:self.passwordTextField.text]) {
        [self submitAction];
    }
    else{
        
        NSLog(@" Not valid input");
        [UIView animateWithDuration:1 delay:0 options:0 animations:^{
            self.passwordConfirmTextField.backgroundColor = [UIColor redColor];
            self.passwordConfirmButtonWidth.constant = self.passwordConfirmButtonWidth.constant - 10;
            [self.view layoutIfNeeded];
        }completion:nil];}
}

#pragma mark - Submit Button Methods

//- (IBAction)submitMoveUp:(id)sender{
//    
//    [UIView animateWithDuration:1 delay:0 options:0 animations:^{
//        self.submitButtonBottomCons.constant += 30;
//        [self.view layoutIfNeeded];
//    } completion:nil];
//    
//}

-(void)submitAction{
    
    self.submitButton.isEnabled == NO;
    self.submitButton.hidden = NO;
}

#pragma mark - UITextFieldDelegate

//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    NSLog(@"shouldBeginEditing?");
//    if ([self.passwordTextField.text isEqualToString: @""]) {
//        NSLog(@"no you may not");
//        return NO;
//    }
//    NSLog(@"yes, thats fine!");
//    return YES;
//}
//-(void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    NSLog(@"didBeginEditing");
//}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.passwordConfirmTextField &&
       [textField.text isEqualToString:self.passwordTextField.text])
    {
        [textField resignFirstResponder];
        return YES;
    }
    return NO;
}

#pragma mark - Editing Changed IBAction
- (IBAction)email:(id)sender {
}
-(IBAction)submitButtonChanged:(id)sender{
    
    [UIView animateWithDuration:1 delay:0 options:0 animations:^{
        self.submitButtonBottomCons.constant += 30;
        [self.view layoutIfNeeded];
    } completion:nil];
    
}
- (IBAction)confirmEmail:(id)sender {
}
- (IBAction)phoneAction:(id)sender {
}
- (IBAction)passwordAction:(id)sender {
}
- (IBAction)confirmPassword:(id)sender {
}
@end
