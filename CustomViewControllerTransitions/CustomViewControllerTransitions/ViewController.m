#import "ViewController.h"
#import "PresentAnimation.h"
#import "DismissAnimation.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) PresentAnimation *presentAnimation;
@property (strong, nonatomic) DismissAnimation *dismissAnimation;

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

- (void)viewDidLoad {
    [super viewDidLoad];
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

@end
