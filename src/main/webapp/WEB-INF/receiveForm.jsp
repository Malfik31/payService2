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
            <form th:href="@{/receive/{id}(id=${transaction.id})}" method="post">
                <h1>Fill form</h1>
                <div class="form-group" hidden="">
                    <label for="id">Id</label>
                    <input
                            class="form-control confirmation-code"
                            id="id"
                            name="id"
                            th:value="${transaction.id}"
                            readonly
                    />
                </div>
                <div class="form-group" hidden="">
                    <label for="amount">Amount</label>
                    <input
                            class="form-control confirmation-code"
                            id="amount"
                            name="amount"
                            th:value="${transaction.amount}"
                            readonly
                    />
                </div>
                <div class="form-group" hidden="">
                    <label for="currency">Currency</label>
                    <input
                            class="form-control"
                            id="currency"
                            name="currency"
                            th:value="${transaction.currency}"
                            readonly
                    />
                </div>
                <div class="form-group" hidden="">
                    <label for="comment">Currency</label>
                    <input
                            class="form-control"
                            id="comment"
                            name="comment"
                            th:value="${transaction.comment}"
                            readonly
                    />
                </div>
                <div class="form-group" hidden="">
                    <label for="status">Status</label>
                    <input
                            class="form-control"
                            id="status"
                            name="status"
                            th:value="${transaction.status}"
                            readonly
                    />
                </div>
                <div class="form-group" hidden="">
                    <label for="receiverId">ReceiverId</label>
                    <input
                            class="form-control"
                            id="receiverId"
                            name="receiver.id"
                            th:value="${transaction.receiver.id}"
                            readonly
                    />
                </div>
                <div class="form-group">
                    <label for="receiverName">Receiver name</label>
                    <input
                            class="form-control"
                            id="receiverName"
                            name="receiver.name"
                            th:value="${transaction.receiver.name}"
                            readonly
                    />
                </div>
                <div class="form-group">
                    <label for="receiverLastname">Receiver lastname</label>
                    <input
                            class="form-control"
                            id="receiverLastname"
                            name="receiver.lastname"
                            th:value="${transaction.receiver.lastname}"
                            readonly
                    />
                </div>
                <div class="form-group" hidden="">
                    <label for="senderId">SenderId</label>
                    <input
                            class="form-control"
                            id="senderId"
                            name="sender.id"
                            th:value="${transaction.sender.id}"
                            readonly
                    />
                </div>
                <div class="form-group" hidden="">
                    <label for="name">SenderName</label>
                    <input
                            class="form-control"
                            id="name"
                            name="sender.name"
                            th:value="${transaction.sender.name}"
                            readonly
                    />
                </div>
                <div class="form-group" hidden="">
                    <label for="lastname">SenderLastname</label>
                    <input
                            class="form-control"
                            id="lastname"
                            name="sender.lastname"
                            th:value="${transaction.sender.lastname}"
                            readonly
                    />
                </div>
                <div class="form-group">
                    <label for="confirmation-code">Secret Code</label>
                    <input
                            class="form-control"
                            name="confirmationCode"
                            id="confirmation-code"
                            placeholder="Confirmation code..."
                            required
                    />
                </div>
                <button type="submit" class="btn btn-primary">
                    Ok
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