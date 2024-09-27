<?php
require('connection.php');
require('header.php');
require('sidebar.php');

// Initialize message variable
$message = "";

// Fetch patient names for the dropdown
$query = "SELECT id, name FROM patients";
$result = $conn->query($query);
$patients = [];

if ($result) {
    while ($row = $result->fetch_assoc()) {
        $patients[] = $row;
    }
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Collect form data
    $patient_id = $_POST['patient_id'];
    $prescription = $_POST['prescription'];
    $tests = isset($_POST['tests']) ? implode(',', $_POST['tests']) : '';

    // Validate form data
    if (!empty($patient_id) && !empty($prescription)) {
        // Generate MD5 hash of the prescription
        $prescription_hash = md5($prescription);

        // Prepare the SQL statement to prevent SQL injection
        $query = "INSERT INTO create_prescription (patient_id, prescription, tests) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('iss', $patient_id, $prescription_hash, $tests);

        if ($stmt->execute()) {
            $message = '<div id="message" class="alert alert-success" role="alert">Prescription created successfully!</div>';
        } else {
            $message = '<div id="message" class="alert alert-danger" role="alert">Error creating prescription: ' . $stmt->error . '</div>';
        }

        $stmt->close();
    } else {
        $message = '<div id="message" class="alert alert-warning" role="alert">Please fill in all fields.</div>';
    }
}
?>

<main id="main" class="main">
    <div class="pagetitle">
        <h1>Create Prescription</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item">Forms</li>
                <li class="breadcrumb-item active">Create Prescription</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Create Prescription</h5>

                        <!-- Display Success or Failure Messages -->
                        <?php if (!empty($message)): ?>
                            <?php echo $message; ?>
                        <?php endif; ?>

                        <!-- Vertical Form -->
                        <form class="row g-3" method="POST" action="">
                            <div class="col-12">
                                <label for="inputPatient" class="form-label">Choose Patient</label>
                                <select name="patient_id" class="form-control" id="inputPatient" required>
                                    <option value="" disabled selected>Select a patient</option>
                                    <?php foreach ($patients as $patient): ?>
                                        <option value="<?php echo $patient['id']; ?>"><?php echo htmlspecialchars($patient['name']); ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="col-12 mt-2">
                                <label for="patientIdDisplay" class="form-label">Patient ID</label>
                                <input type="text" id="patientIdDisplay" class="form-control" readonly>
                            </div>
                            <div class="col-12 mt-2">
                                <label for="inputPrescription" class="form-label">Add Prescription</label>
                                <input type="text" name="prescription" class="form-control" id="inputPrescription" required>
                            </div>
                            <div class="col-12 mt-2">
                                <label class="form-label">Select Tests</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tests[]" value="test1" id="test1">
                                    <label class="form-check-label" for="test1">Hemoglobin </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tests[]" value="test2" id="test2">
                                    <label class="form-check-label" for="test2">Creatin </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tests[]" value="test3" id="test3">
                                    <label class="form-check-label" for="test3">Tac level</label>
                                </div>
                                
                            </div>
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form><!-- Vertical Form -->

                    </div>
                </div>
            </div>
        </div>
    </section>
</main><!-- End #main -->

<?php require('footer.php'); ?>

<script>
    document.getElementById('inputPatient').addEventListener('change', function() {
        var selectedPatientId = this.value;
        document.getElementById('patientIdDisplay').value = selectedPatientId;
    });

    // Automatically hide the message after 5 seconds
    setTimeout(function() {
        var messageElement = document.getElementById('message');
        if (messageElement) {
            messageElement.style.display = 'none';
        }
    }, 5000); // 5000 milliseconds = 5 seconds
</script>
