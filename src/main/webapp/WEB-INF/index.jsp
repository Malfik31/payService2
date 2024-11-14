<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js">
    </script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js">
    </script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js">
    </script>
    <title>Cash machine</title>
</head>

<body>
<div>
    <a href="/logout">Logout</a>
</div>
<div>
    <a href="/send">New transaction</a>
</div>

<div>
    <h4>All transactions</h4>
    <table id="transactionsTable" class="table table-striped table-bordered table-sm">
        <thead>
        <tr>
            <th class="th-sm">ID</th>
            <th class="th-sm">Sender username</th>
            <th class="th-sm">Receiver username</th>
            <th class="th-sm">Amount</th>
            <th class="th-sm">Currency</th>
            <th class="th-sm">Comment</th>
            <th class="th-sm">Status</th>
            <th class="th-sm">Receive</th>
        </tr>
        </thead>
        <tbody>
        <tr th:each="transaction: ${transactions}">
            <td th:text="${transaction.id}"></td>
            <td th:text="${transaction.sender.username}"></td>
            <td th:text="${transaction.receiver.username}"></td>
            <td th:text="${transaction.amount}"></td>
            <td th:text="${transaction.currency}"></td>
            <td th:text="${transaction.comment}"></td>
            <td id="status" th:text="${transaction.status}"></td>
            <td>
                <a th:unless="${transaction.status == 'PENDING'}" th:href="@{/receive/{id}(id=${transaction.id})}">Receive</a>
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <th class="th-sm">ID</th>
            <th class="th-sm">Sender username</th>
            <th class="th-sm">Receiver username</th>
            <th class="th-sm">Amount</th>
            <th class="th-sm">Currency</th>
            <th class="th-sm">Comment</th>
            <th class="th-sm">Status</th>
            <th class="th-sm">Receive</th>
        </tr>
        </tfoot>
    </table>
</div>
<script>
    $(document).ready(function () {
        $('#transactionsTable').DataTable();
    });
</script>
</body>
</html>
