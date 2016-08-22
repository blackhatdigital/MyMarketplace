jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  packages.setupForm()

packages =
  setupForm: ->
    $('#new_package').submit ->
      $('input[type=submit]').attr('disabled', true)
      Stripe.bankAccount.createToken($('#new_package'), packages.handleStripeResponse)
      false

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#new_package').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      $('#new_package')[0].submit()
    else
      $('#stripe_error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)