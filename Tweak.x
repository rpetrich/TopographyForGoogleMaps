#import <UIKit/UIKit.h>

%hook AZLayersViewController

- (UIButton *)buttonWithTitle:(NSString *)title imageSelector:(SEL)imageSelector layerOption:(unsigned)layerOption
{
	%log;
	BOOL isEarth = [title isEqualToString:@"Google Earth"];
	if (isEarth) {
		title = @"Topography";
		imageSelector = @selector(layersSatelliteButtonForState:);
		layerOption = 4;
	}
	UIButton *result = %orig();
	if (isEarth) {
		[result removeTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
		[result addTarget:self action:@selector(didTapTopographyButton) forControlEvents:UIControlEventTouchUpInside];
	}
	return result;
}

%new
- (void)didTapTopographyButton
{
	id delegate = [self valueForKeyPath:@"delegate"];
	[delegate layersViewController:self didChangeLayerOptions:0];
	id mapView = [delegate valueForKeyPath:@"mapViewController.mapView"];
	[mapView setMapBaseMode:4 mapBaseLabelMode:3];
}

%end
