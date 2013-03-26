# A_DAY = 1000 * 3600 * 24

$ ->

  human_readable_format = (thetime) ->
    now = +new Date
    a_day = 86400000
    thetime = +thetime

    firstmillisecond = moment()
    firstmillisecond.hours(0)
    firstmillisecond.minutes(0)
    firstmillisecond.seconds(0)
    firstmillisecond.milliseconds(0)

    if thetime >= firstmillisecond
      return moment(thetime).format("HH:mm")
    else if moment(thetime).year() == moment().year()
      return moment(thetime).format("MM-DD HH:mm")
    else
      return moment(thetime).format("YY-MM-DD")

  last_time_stamp = 0
  $("[datetime]").each (index, elem) ->
    # item_date = moment elem.datetime
    # start_of_day = moment item_date
    # start_of_day.milliseconds 0
    # start_of_day.seconds 0
    # start_of_day.minutes 0
    # start_of_day.hours 0

    $(elem).text(human_readable_format($(elem).attr('datetime')))
    console.log last_time_stamp
    if last_time_stamp && last_time_stamp - $(elem).attr('datetime') > 1000 * 60 * 10
      $(elem).closest('.entry').before('<li class="gap"></li>')
    last_time_stamp = $(elem).attr('datetime')






