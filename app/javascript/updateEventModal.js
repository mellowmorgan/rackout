export function updateModal(data) {
  if (data && data.length > 1){
    var btn = document.getElementById("updateBtn");
    var dismiss = document.getElementById("dismissBtn");
    var dismissAll = document.getElementById("dismissAllBtn");
    var modal = document.getElementById("myModal");
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    var select = document.getElementById("eventsDropDown");
    var options = [];
    var option = document.createElement('option');
    window.addEventListener("DOMContentLoaded", function() {
    setTimeout(modalFunction, 1000);
    });
    var user_id = data[0].user_id;
  
    function modalFunction(){
      
      modal.style.display = "block";
     
  
      //for (var i = 2011; i >= 1900; --i)
      for (var i = 0; i < data.length; ++i)
      {
  
        let date = new Date(data[i].start_time);
        option.text = data[i].title + " on " + date.toLocaleString("en", { weekday: "long" }) + ", " + date.toLocaleString("en-US", { timeZone: "UTC", dateStyle: 'long',timeStyle: 'short'});
        option.value = data[i].id;
        options.push(option.outerHTML);
      }
      
      select.insertAdjacentHTML('beforeEnd', options.join('\n'));
    }
  
   
  
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }
  
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
    btn.onclick = function() {
      var url = `/users/${user_id}/events/${select.value}` 
      if (url) {
        window.location.replace(url);
      }
      return false;
    }
  
    dismiss.onclick = async function() {
   
      var event_id = select.value 
      var url = `/users/${user_id}/events/` + event_id
      const request = new Request(url, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({event: {dismiss:true, user_id: user_id, id: event_id}})
      })
  
  
       try {
        const response = await fetch(request);
        if (!response.ok) {
          throw new Error(`Response status: ${response.status}`);
        }
    
        const json = await response;
        
      // Upon dimiss we must also update the select dropdown to no longer show updated/dismissed event
      // Have to find option's index to remove
      var child = null;
      
      for (var i = 0; i < data.length; ++i)
        {
          if (select.options[i].value == event_id){
            child = select.options[i]
            break;
          }
          
        }
      select.removeChild(child);
  
      // If no more options left, close out the modal
      if (select.options.length == 0){
        modal.style.display = "none";
      }
  
  
      } catch (error) {
        console.log("in error")
        console.error(error.message);
      }
    }

    dismissAll.onclick = async function() {
  
      var url = '/dismiss_all'
      const request = new Request(url, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({user_id: user_id})
      })
      
    
      
       try {
        const response = await fetch(request);
        if (!response.ok) {
          throw new Error(`Response status: ${response.status}`);
        }
    
        const json = await response;
        
      // Upon dimiss all get rid of modal
      modal.style.display = "none";
  
      } catch (error) {
        console.log("in error")
        console.error(error.message);
      }
    }
}}