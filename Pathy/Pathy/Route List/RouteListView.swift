//
//  RouteListView.swift
//  Pathy
//
//  Created by Mason Drabik on 3/18/24.
//

import SwiftUI

struct RouteListView: View {
    @StateObject private var vm = RouteListViewModel()
    @State private var showingRouteInProgressScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                // TODO: Switch over vm.state and show the correct view
                // - Idle: idleView
                // - Loading: loadingView
                // - Success: routesView(routes:)
                // - Error: ErrorView(message:)
                switch vm.state {
                case .idle:
                    idleView
                case .loading:
                    loadingView
                case .success(let routes):
                    routesView(routes: routes)
                case .error(let message):
                    errorView(message: message)
                }
            }
            .navigationTitle("Pathy")
            .navigationBarTitleDisplayMode(.inline)
            .listRowSpacing(12)
            .toolbar {
                Button {
                    showingRouteInProgressScreen.toggle()
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 17, height: 17)
                }
            }
            .fullScreenCover(isPresented: $showingRouteInProgressScreen) {
                // TODO: Call vm.fetchAllRoutes
                // - Context: This is the onDismiss closure passed to fullScreenCover. It's
                //   called when the sheet is dismissed
                Task{
<<<<<<< HEAD
                    await vm.fetchAllRoutes()
                }
                
=======
                    vm.fetchAllRoutes
                }
>>>>>>> 2e3bf9b055d4279da6f88b65f076c58a5db72d33
              
            } content: {
                // TODO: Show RouteInProgressView as the fullScreenCover's content
                RouteInProgressView()
            }
            .refreshable {
                // TODO: Call vm.fetchAllRoutes
                // - Hint: Do you need a Task block here? 🤔
                Task {
<<<<<<< HEAD
                    await vm.fetchAllRoutes()
=======
                    vm.fetchAllRoutes
>>>>>>> 2e3bf9b055d4279da6f88b65f076c58a5db72d33
                }
            }
            .task {
                // TODO: Call vm.fetchAllRoutes
                // - Hint: Do you need a Task block here? 🤔
<<<<<<< HEAD
                   await vm.fetchAllRoutes()
=======
                Task {
                    vm.fetchAllRoutes
                }
>>>>>>> 2e3bf9b055d4279da6f88b65f076c58a5db72d33
            }
        }
    }
    
    @ViewBuilder
    private var idleView: some View {
        ContentUnavailableView("Pull down to make a request", systemImage: "map.circle")
    }
    
    @ViewBuilder
    private var loadingView: some View {
        ContentUnavailableView("Loading...", systemImage: "arrow.triangle.2.circlepath")
    }
    
    @ViewBuilder
    private func routesView(routes: [Route]) -> some View {
        if routes.isEmpty {
            ContentUnavailableView("There are no routes to display", systemImage: "mappin.slash.circle")
        } else {
            // TODO: Display a RouteListItemView for every route
            ForEach(routes) { route in
                RouteListItemView(route: route)
                    .listRowInsets(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
<<<<<<< HEAD
=======
                    // TODO: Use .listRowInsets(...) inside your ForEach to set the insets correctly (see Figma to figure out correct value. hint: look for multiple of 4)
                    // TODO: Use .swipeActions(...) inside your ForEach to implement swipe to delete
>>>>>>> 2e3bf9b055d4279da6f88b65f076c58a5db72d33
                    .swipeActions {
                        Button(role: .destructive) {
                            Task {
                                await vm.delete(route: route)
                            }
<<<<<<< HEAD
=======
                            Task {
                                await vm.delete(route: route)
                            }
>>>>>>> 2e3bf9b055d4279da6f88b65f076c58a5db72d33
                        } label: {
                            Image(systemName: "trash")
                        }
                        .tint(.red)
                    }
            }
        }
    }
    
    @ViewBuilder
    private func errorView(message: String) -> some View {
        ContentUnavailableView(message, systemImage: "exclamationmark.circle")
    }
}

#Preview {
    RouteListView().environmentObject(LocationManager())
}