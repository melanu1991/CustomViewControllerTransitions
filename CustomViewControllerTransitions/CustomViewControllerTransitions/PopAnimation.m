#import "PopAnimation.h"

@implementation PopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    toView.frame = CGRectMake(-toView.bounds.size.width, 0.f, toView.bounds.size.width, toView.bounds.size.height);
    [containerView addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.frame = CGRectMake(0.f, 0.f, toView.bounds.size.width, toView.bounds.size.height);
    } completion:^(BOOL finished){
        [fromView removeFromSuperview];
        [transitionContext completeTransition:finished];
    }];
    
}

@end
