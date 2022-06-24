//
//  FindOutTests.swift
//  FindOutTests
//
//  Created by Putra on 03/06/22.
//

import XCTest
@testable import FindOut
@testable import MovieModule
@testable import CoreFindOut
@testable import HomeOut
@testable import FavoriteModule

class FindOutTests: XCTestCase {

    
    func testGetMovie() {
        let movieUsecase: InteractorCore<Any, [HomePlayingModel],
                                         HomeModuleMovieRepo<HomeMovieLocaleDataSource,
                                         HomeRemoteDataSource,
                                                             HomeMovieTransformer>> = Injection.init().provideHomeMovieUsecase()
        
        let homePresenter = GetListPresenter(useCase: movieUsecase)
        
        let favoriteUsecase: InteractorFavorite<[FavoriteListEntity], [FavoriteModel], FavoriteModuleRepo<FavoriteLocaleDataSource, FavoriteRemoteDataSource,FavoriteModuleTransformer>> = Injection.init().provideFavoriteUseCase()
        var homePlaying = [HomePlayingModel]()
        
        movieUsecase.execute(request: nil)
            .sink(receiveCompletion: {_ in
                
            }, receiveValue: { data in
                XCTAssertNotNil(data)
                homePlaying.append(data.first!)
            })
        XCTAssertEqual(homePlaying.count, 1)
        
        favoriteUsecase.get(id: "\(homePlaying.first?.id ?? 0)", endPoint: EndPoints.EP.detailMovie("\(homePlaying.first?.id ?? 0)").url)
            .sink(receiveCompletion: {_ in

            }, receiveValue: { sukses in
                XCTAssertTrue(sukses)
            })
    }
    
    func testGetDetailMovie() {
        
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
