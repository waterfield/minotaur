{ assert } = chai

describe 'JSON to HTML', ->
  it 'should convert JSON to HTML Tree', ->
    myObj =
      "id": 1
      "foo": "bar"
      "something": [
        {"another": "something"}
        {"again": "something else"}
      ]
      "something_different":
        "multilevel":
          "secondlevel": "bar"
        "secondfirstlevel": "foo"
      "nullvalue": null
      "undefinedvalue": undefined

    htmlString = '<ul class="tree"><li><span>id</span><ul class="tree"><li>1</li></ul></li><li><span>foo</span><ul class="tree"><li>bar</li></ul></li><li><span>something</span><ul class="tree"><li><span>another</span><ul class="tree"><li>something</li></ul></li><li><span>again</span><ul class="tree"><li>something else</li></ul></li></ul></li><li><span>something_different</span><ul class="tree"><li><span>multilevel</span><ul class="tree"><li><span>secondlevel</span><ul class="tree"><li>bar</li></ul></li></ul></li><li><span>secondfirstlevel</span><ul class="tree"><li>foo</li></ul></li></ul></li><li><span>nullvalue</span><ul class="tree"><li>null</li></ul></li><li><span>undefinedvalue</span><ul class="tree"><li>undefined</li></ul></li></ul>'
    testedHtmlString = build myObj
    assert.equal testedHtmlString, htmlString