#import <UIKit/UIKit.h>

@class WPNoResultsView;
@protocol WPNoResultsViewDelegate <NSObject>

@optional
- (void)didTapNoResultsView:(WPNoResultsView *)noResultsView;
@end

@interface WPNoResultsView : UIView

@property (nonatomic, strong) NSString                      *titleText;
@property (nonatomic, strong) NSString                      *messageText;
@property (nonatomic, strong) NSString                      *buttonTitle;
@property (nonatomic, strong) UIView                        *accessoryView;
@property (nonatomic, strong) UIButton                      *button;
@property (nonatomic,   weak) id<WPNoResultsViewDelegate>   delegate;

/**
 This property is intended to be used to actionable links to the message string.
 Color, Font, and Text Alignment attributes will be overriden to match the noraml message text style.
 Other attributes like bold or subline can still be added.
 */
@property (nonatomic, strong) NSAttributedString            *attributedMessageText;

+ (instancetype)noResultsViewWithTitle:(NSString *)titleText message:(NSString *)messageText accessoryView:(UIView *)accessoryView buttonTitle:(NSString *)buttonTitle;

- (void)showInView:(UIView *)view;
- (void)centerInSuperview;

@end
