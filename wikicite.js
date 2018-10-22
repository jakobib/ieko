$(function () {
  const regex = new RegExp('Q[0-9]+')
  const icon = '<img src="wikidata-logo.svg" width="16px"/>'
  const base = 'http://www.wikidata.org/entity/'

  $('.references > div > p').contents()
  .filter(function () {
    return this.nodeType === 3 && regex.test(this.nodeValue) 
  })
  .each(function () {
    $(this).replaceWith(
      this.nodeValue.replace(/Q[0-9]+/g, function (qid) {
        return '<a href="'+base+qid+'" alt="Wikidata">'+icon+'</a>'
      })
    )
  })
})
