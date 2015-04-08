
listUsers = 
    namnv609: '28229691230024'
    dinhhoanglong91: '25362694685287'
    nguyenthanhtung88: '28554407143539'
    tranluan91: '25996172785139'
    wataridori: '28554407143532'

Gitana = ->
    gitUser = $ "strong a.author:first"
        .text()
        .trim()

    $issueTitle = $ '.js-issue-title'
    issueText = $issueTitle.text()
    asanaRefs = issueText.split /\s/
    resultText = ""

    $.each asanaRefs, (idx, asanaRef) ->
        refID = asanaRef.split /#/

        if refID.length > 1
            resultText += "<a href='https://app.asana.com/0/#{listUsers[gitUser]}/#{refID[1]}' target='_blank'>#{asanaRef}</a> "
        else
            resultText += "#{asanaRef} "

    $issueTitle.html resultText.trim()

Gitana()

$ '.site'
    .bind 'DOMNodeInserted', (e) ->
        Gitana() if $(e.target).is '.issues-listing'