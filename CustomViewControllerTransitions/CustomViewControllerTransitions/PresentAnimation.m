#import "PresentAnimation.h"

@interface PresentAnimation ()

@end

@implementation PresentAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 2.f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    toView.transform = CGAffineTransformMakeScale(0.f, 0.f);
    [containerView addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.transform = CGAffineTransformMakeScale(1.f, 1.f);
    } completion:^(BOOL finished){
        [fromView removeFromSuperview];
        [transitionContext completeTransition:finished];
    }];
}

@end
