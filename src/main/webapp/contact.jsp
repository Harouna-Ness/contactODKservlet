<%-- 
    Document   : contact
    Created on : 28 mai 2024, 08:56:31
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function saveContact() {
            const index = document.getElementById("index").value;
            const name = document.getElementById("name").value;
            const email = document.getElementById("email").value;
            const phone = document.getElementById("phone").value;
            const conmpetance = document.getElementById("Conmpetance").value;

            const contact = { name, email, phone, conmpetance};
            let contacts = JSON.parse(localStorage.getItem("contacts")) || [];

            if (index === "") {
                contacts.push(contact);
            } else {
                contacts[parseInt(index)] = contact;
            }

            localStorage.setItem("contacts", JSON.stringify(contacts));
            clearForm();
            displayContacts();
        }

            // Function to display contacts from local storage
            function displayContacts() {
                const contacts = JSON.parse(localStorage.getItem("contacts")) || [];
                const contactList = document.getElementById("contact-list");
                contactList.innerHTML = "";

                contacts.forEach((contact, index) => {
                    const contactItem = document.createElement("li");
                    contactItem.innerHTML = "<p>" + contact.name + "</p> <P>" + contact.email + "</p> <P>" + contact.phone + "</p> <P>" + contact.conmpetance    + "</p> <button onclick='deleteContact(index)'>Delete</button>";
                    contactList.appendChild(contactItem);
                });
            }

            // Function to delete a contact
            function deleteContact(index) {
                let contacts = JSON.parse(localStorage.getItem("contacts")) || [];
                contacts.splice(index, 1);
                localStorage.setItem("contacts", JSON.stringify(contacts));
                displayContacts();
            }
            
            // Function to edit a contact
        function editContact(item) {
            console.log(item);
            let contacts = JSON.parse(localStorage.getItem("contacts")) || [];
            
            contacts.forEach((contact, index) => {
                if(contact===item) {
                    console.log("trouvé ",contact);
                }
            });
            
            const contact = contacts[parseInt(item)];
            console.log("ici", contact);

        }

        // Function to clear the form
        function clearForm() {
            document.getElementById("index").value = "";
            document.getElementById("name").value = "";
            document.getElementById("email").value = "";
            document.getElementById("phone").value = "";
            document.getElementById("Conmpetance").value = "";
        }

            // Display contacts when the page loads
            window.onload = displayContacts;
        </script>

    </head>
    <body>
    <body>
        <h1>Nouveau enregistrement</h1>
        <form onsubmit="saveContact(); return false;">
            <input type="hidden" id="index">
            <label for="name">Nom etprenom:</label>
            <input type="text" id="name" name="name" required>
            <br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <br>
            <label for="phone">Téléphone:</label>
            <input type="text" id="phone" name="phone" required>
            <br>
            <label for="Conmpetance">Conmpetance:</label>
            <input type="text" id="Conmpetance" name="Conmpetance" required>
            <br>
            <button type="submit">Enregistrer</button>
            <button type="button" onclick="clearForm()">Vider tous les champs</button>
        </form>
        <h2>Liste des contacts</h2>
        <ul id="contact-list"></ul>
    </body>
</body>
</html>
