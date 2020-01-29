import XCTest
@testable import WordPressShared

class StringStripGutenbergContentForExcerptTests: XCTestCase {
    
    func testSummaryForContentWithGallery() {
        let content = "<!-- wp:gallery {\"ids\":[2315,2309,2308]} --><figure class=\"wp-block-gallery columns-3 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"https://diegotest4.files.wordpress.com/2020/01/img_0005-1-1.jpg\" data-id=\"2315\" class=\"wp-image-2315\"/><figcaption class=\"blocks-gallery-item__caption\">Asdasdasd</figcaption></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://diegotest4.files.wordpress.com/2020/01/img_0111-1-1.jpg\" data-id=\"2309\" class=\"wp-image-2309\"/><figcaption class=\"blocks-gallery-item__caption\">Asdasdasd</figcaption></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://diegotest4.files.wordpress.com/2020/01/img_0004-1.jpg\" data-id=\"2308\" class=\"wp-image-2308\"/><figcaption class=\"blocks-gallery-item__caption\">Adsasdasdasd</figcaption></figure></li></ul></figure><!-- /wp:gallery --><p>Some Content</p>"
        let expectedSummary = "<p>Some Content</p>"
        
        let summary = content.strippingGutenbergContentForExcerpt()
        
        XCTAssertEqual(summary, expectedSummary)
    }
    
    func testSummaryForContentWithGallery2() {
        let content = "<p>Before</p>\n<!-- wp:gallery {\"ids\":[2315,2309,2308]} --><figure class=\"wp-block-gallery columns-3 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"https://diegotest4.files.wordpress.com/2020/01/img_0005-1-1.jpg\" data-id=\"2315\" class=\"wp-image-2315\"/><figcaption class=\"blocks-gallery-item__caption\">Asdasdasd</figcaption></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://diegotest4.files.wordpress.com/2020/01/img_0111-1-1.jpg\" data-id=\"2309\" class=\"wp-image-2309\"/><figcaption class=\"blocks-gallery-item__caption\">Asdasdasd</figcaption></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://diegotest4.files.wordpress.com/2020/01/img_0004-1.jpg\" data-id=\"2308\" class=\"wp-image-2308\"/><figcaption class=\"blocks-gallery-item__caption\">Adsasdasdasd</figcaption></figure></li></ul></figure><!-- /wp:gallery --><p>After</p>"
        let expectedSummary = "<p>Before</p>\n<p>After</p>"
        
        let summary = content.strippingGutenbergContentForExcerpt()
        
        XCTAssertEqual(summary, expectedSummary)
    }
}
