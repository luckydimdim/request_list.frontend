import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:resources_loader/resources_loader.dart';

@Component(selector: 'request-list')
@View(
    templateUrl: 'request_list_component.html', directives: const [RouterLink])
class RequestListComponent implements OnInit, OnDestroy {
  static const String route_name = "RequestList";
  static const String route_path = "request-list";
  static const Route route = const Route(
      path: RequestListComponent.route_path,
      component: RequestListComponent,
      name: RequestListComponent.route_name);

  final Router _router;
  final ResourcesLoaderService _resourcesLoaderService;
  RequestListComponent(this._router, this._resourcesLoaderService) {}

  void breadcrumbInit(){
  }

  @override
  void ngOnInit() {

    breadcrumbInit();
  }

  @override
  void ngOnDestroy() {
  }
}
