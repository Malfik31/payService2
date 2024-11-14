<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <title>Form</title>
</head>
<body>

<div>
    <div>
        <a href="/logout">Logout</a>
    </div>
    <div class="row align-items-center" style="height: 100vh;">
        <div class="mx-auto col-10">
            <form action="/send" method="POST">
                <h1>Fill form</h1>
                <input hidden name="sender.id" th:value="${id}">
                <div class="form-group">
                    <label for="senderUsername">Sender username</label>
                    <input required class="form-control" type="text" name="sender.username" placeholder="Username..."
                           id="senderUsername">
                </div>
                <div class="form-group">
                    <label for="receiverUsername">Receiver username</label>
                    <input required class="form-control" type="text" name="receiver.username" placeholder="Username..."
                           id="receiverUsername">
                </div>
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input required class="form-control" type="number" name="amount" placeholder="Amount..."
                           id="amount">
                </div>
                <div class="form-group">
                    <label for="currency">Currency</label>
                    <select class="form-select" name="currency" id="currency">
                        <option selected>KGS</option>
                        <option>KZT</option>
                        <option>RUB</option>
                        <option>USD</option>
                        <option>EUR</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="comment">Comment</label>
                    <input class="form-control" type="text" name="comment" placeholder="Comment..." id="comment">
                </div>

                <button type="submit" class="btn btn-primary">
                    Send
                </button>
            </form>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>