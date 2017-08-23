#import "CustomInteractionController.h"

@interface CustomInteractionController ()

@property (assign, nonatomic, getter = isShouldCompleteTransition) BOOL shouldCompleteTransition;
@property (weak, nonatomic) UIViewController *viewController;

@end

@implementation CustomInteractionController

- (void)wireToViewController:(UIViewController *)viewController {
    self.viewController = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView:(UIView *)view {
    UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    gesture.edges = UIRectEdgeLeft;
    [view addGestureRecognizer:gesture];
}

- (void)handleGesture:(UIScreenEdgePanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    CGFloat progress = translation.x / 200.f;
    progress = fminf(fmaxf(progress, 0.f), 1.f);
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.interactionInProgress = YES;
            [self.viewController.navigationController popViewControllerAnimated:YES];
            break;
        case UIGestureRecognizerStateChanged:
            self.shouldCompleteTransition = progress > 0.5f;
            [self updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateCancelled:
            self.interactionInProgress = NO;
            [self cancelInteractiveTransition];
            break;
        case UIGestureRecognizerStateEnded:
            self.interactionInProgress = NO;
            self.isShouldCompleteTransition ? [self cancelInteractiveTransition] : [self finishInteractiveTransition];
            break;
        default:
            break;
    }
}

@end
