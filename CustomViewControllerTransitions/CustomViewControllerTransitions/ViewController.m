#import "ViewController.h"
#import "PresentAnimation.h"
#import "DismissAnimation.h"
#import "PushAnimation.h"
#import "PopAnimation.h"

@interface ViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) PresentAnimation *presentAnimation;
@property (strong, nonatomic) DismissAnimation *dismissAnimation;
@property (strong, nonatomic) PushAnimation *pushAnimation;
@property (strong, nonatomic) PopAnimation *popAnimation;
@property (assign, nonatomic, getter = isReverse) BOOL reverse;

@end

@implementation ViewController

- (PresentAnimation *)presentAnimation {
    if (!_presentAnimation) {
        _presentAnimation = [PresentAnimation new];
    }
    return _presentAnimation;
}

- (DismissAnimation *)dismissAnimation {
    if (!_dismissAnimation) {
        _dismissAnimation = [DismissAnimation new];
    }
    return _dismissAnimation;
}

- (PushAnimation *)pushAnimation {
    if (!_pushAnimation) {
        _pushAnimation = [PushAnimation new];
    }
    return _pushAnimation;
}

- (PopAnimation *)popAnimation {
    if (!_popAnimation) {
        _popAnimation = [PopAnimation new];
    }
    return _popAnimation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
}

- (IBAction)back:(UIStoryboardSegue *)sender {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ModalSegue"]) {
        UIViewController *dvc = segue.destinationViewController;
        dvc.transitioningDelegate = self;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (self.isReverse) {
        self.reverse = NO;
        return self.popAnimation;
    }
    else {
        self.reverse = YES;
        return self.pushAnimation;
    }
}

@end
